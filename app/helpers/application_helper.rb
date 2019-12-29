module ApplicationHelper
  def title(custom_title = nil)
    # 'company/jobs' => 'company.jobs'
    namespace_and_controller = controller_path.gsub('/', '.')
    page_title = custom_title || t("#{namespace_and_controller}.#{action_name}.title", default: '')
    base_title = Rails.application.config.hostname || 'anti.work'

    if page_title.present?
      page_title + ' — ' + base_title
    else
      base_title
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
end
