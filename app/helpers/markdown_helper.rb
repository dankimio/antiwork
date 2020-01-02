module MarkdownHelper
  # markdown('# Text') => `<h1>Text</h1>`
  # markdown('# Text', sanitize_tags: []) => `Text`
  # markdown('_em_ __strong__', sanitize_tags: ['em']) => `<em>Text</em> strong`
  def markdown(text = '', sanitize_tags: false)
    html = Kramdown::Document.new(text).to_html

    if sanitize_tags
      sanitize(html, tags: sanitize_tags)
    else
      html
    end
  end
end
