module Morpheus

  class EmoticonService < ParsingService

    def generate
      source.scan(/(?<=\()(\w{1,15})(?=\))/).flatten
    end

  end

end
