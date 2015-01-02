module NotekatTags
  class Extractor
    include NotekatTags::RegularExpressions
    def self.extract_tags(text)
      text ||= ''
      text.scan(HASHTAG_EXPRESSION)
    end
  end
end