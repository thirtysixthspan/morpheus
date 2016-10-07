require 'net/http'
require 'uri'

module Morpheus

  class PageTitleService
    include Helpers

    def initialize(url)
      fail PageTitleError unless url.present? && url =~ URI::regexp

      self.url = url
    end

    def fetch
      with_retries(3, [StandardError]) { title }
    end

    private

    attr_accessor :url

    def uri
      URI.parse(url)
    end

    def body
      Net::HTTP.get(uri)
    end

    def document
      Oga.parse_html(body)
    end

    def title
      document.at_css('title').text
    end

  end

end
