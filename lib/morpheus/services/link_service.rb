require "uri"

module Morpheus

  class LinkService < ParsingService

    def generate
      http_urls.map{ |url| Link.new(url: url).to_h }
    end

    private

    def http_urls
      all_urls.select{ |url| ['http', 'https'].include?(URI(url).scheme) }
    end

    def all_urls
      URI.extract(source)
    end

  end

end
