module ApplicationHelper
  def title(custom_title = nil)
    page_title = custom_title || t("#{current_translation_path}.title", default: '')
    base_title = Rails.application.config.hostname || 'anti.work'

    if page_title.present?
      "#{page_title} — #{base_title}"
    else
      base_title
    end
  end

  def meta_description(custom_description = nil, limit: 150)
    page_description = custom_description ||
                       t("#{current_translation_path}.meta_description", default: '')

    if page_description.present?
      page_description.truncate(limit)
    else
      t('layouts.application.meta_description').truncate(limit)
    end
  end

  def current_translation_path
    # `company/jobs` => `company.jobs`
    namespace_and_controller = controller_path.gsub('/', '.')
    # `company.jobs.index`
    "#{namespace_and_controller}.#{action_name}"
  end
end
