module Morpheus

  class Metadata
    include Helpers

    attr_accessor :source

    def initialize(source)
      self.source = source
    end

    def to_h
      merge({}, {
        mentions: mentions,
        emoticons: emoticons,
        links: links
      })
    end

    def mentions
      MentionService.new(source).generate
    end

    def emoticons
      EmoticonService.new(source).generate
    end

    def links
      LinkService.new(source).generate
    end

  end

end
