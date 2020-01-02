module ApplicationHelper
  def title(custom_title = nil)
    page_title = custom_title || t("#{current_translation_path}.title", default: '')
    base_title = Rails.application.config.hostname || 'anti.work'

    if page_title.present?
      page_title + ' — ' + base_title
    else
      base_title
    end
  end

  def meta_description(custom_description = nil)
    page_description = custom_description ||
                       t("#{current_translation_path}.meta_description", default: '')

    if page_description.present?
      page_description
    else
      t('layouts.application.meta_description')
    end
  end

  def markdown(text = '')
    html = Kramdown::Document.new(text).to_html
    sanitize html, tags: %w[a em h2 h3 h4 h5 h6 li p strong ul]
  end

  def raw_markdown(text = '')
    html = Kramdown::Document.new(text).to_html
    sanitize html, tags: []
  end

  def current_translation_path
    # `company/jobs` => `company.jobs`
    namespace_and_controller = controller_path.gsub('/', '.')
    # `company.jobs.index`
    "#{namespace_and_controller}.#{action_name}"
  end
end
