module ApplicationHelper
  def title(custom_title = nil)
    page_title = custom_title || t("#{controller_name}.#{action_name}.title", default: '')
    base_title = "#{Rails.application.config.hostname || 'anti.work'}"

    if page_title.present?
      page_title + ' — ' + base_title
    else
      base_title
    end
  end
end
