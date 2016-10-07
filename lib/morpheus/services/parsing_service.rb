module Morpheus

  class ParsingService

    def initialize(source)
      fail ParseError unless source.present?

      self.source = source
    end

    private

    attr_accessor :source

  end

end
