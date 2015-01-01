module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def format_note(text)
    hashtag_regular_expression = /#(\w+)/
    text ||= ''

    hashtags = text.scan(hashtag_regular_expression)

    # TODO: change tags/ to use tag_url or path
    text_formatted = text.gsub(hashtag_regular_expression, "[#\\1](/tags/\\1)")
    text_formatted = markdown(text_formatted)
    
    text_formatted
  end
end
