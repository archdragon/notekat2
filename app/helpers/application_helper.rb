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

    hashtags = NotekatTags::Extractor.extract_tags(text)
    text_formatted = NotekatTags::Formatter.format(text)
    text_formatted = "Empty note. \n\n\n Click the button on the right to add some text!" if text_formatted == ""
    text_formatted = markdown(text_formatted)

    text_formatted
  end
end
