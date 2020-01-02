class TelegramChannelService
  TELEGRAM_TOKEN = Rails.application.credentials.telegram.fetch(:token)
  TELEGRAM_CHAT_ID = Rails.application.credentials.telegram.fetch(:chat_id)
  TELEGRAM_PARSE_MODE = 'HTML'.freeze

  def initialize(job)
    @job = job
  end

  def post
    options = {
      chat_id: TELEGRAM_CHAT_ID,
      parse_mode: TELEGRAM_PARSE_MODE,
      text: format_job
    }

    response = HTTParty.get(
      "https://api.telegram.org/bot#{TELEGRAM_TOKEN}/sendMessage",
      query: options
    )
  end

  private

  def format_job
    html = Kramdown::Document.new(@job.description).to_html
    html = Nokogiri::HTML.fragment(html)

    # Replace `<li>Item</li>` with `– Item`
    html.css('li').each do |node|
      node.name = 'p'
      node.inner_html = node.inner_html.prepend('– ')
    end
    html.css('h2, h3, h4, h5, h6').each { |node| node.name = 'strong' }

    result = ActionController::Base.helpers.sanitize(
      html.to_html,
      tags: %w[a em li strong]
    ).squeeze(' ').gsub("\n\n\n", "\n\n")
  end
end
