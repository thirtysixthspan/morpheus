module Morpheus

  class Link
    include Helpers

    attr_accessor :url
    attr_writer :title

    def initialize(url:, title: nil)
      self.url = url
      self.title = title if title
    end

    def to_h
      merge({}, {
        url: url,
        title: title
      })
    end

    def title
      @title ||= PageTitleService.new(url).fetch
    rescue PageTitleError
      nil
    end

  end

end
