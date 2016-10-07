module Morpheus

  class MentionService < ParsingService

    def generate
      source.scan(/(?<=\@)(\w+)(?=\W*)/).flatten
    end

  end

end
