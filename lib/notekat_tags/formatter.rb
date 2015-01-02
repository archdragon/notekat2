module NotekatTags
  class Formatter
    include NotekatTags::RegularExpressions
    def self.format(text)
      # TODO: change tags/ to use tag_url or path
      text.gsub(HASHTAG_EXPRESSION, "[#\\1](/notes/tag/\\1)")
    end
  end
end