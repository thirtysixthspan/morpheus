module V1
  module MediaTypes

    class Link < Praxis::MediaType

      identifier 'application/json'
      description 'This is a web link response'

      attributes do
        attribute :url, String,
          description: 'Web URL',
          example: 'http://www.nbcolympics.com'
        attribute :title, String,
          description: 'Title of Web Page at URL',
          example: '2016 Rio Olympic Games | NBC Olympics'
      end

      view :default do
        attribute :url
        attribute :title
      end

    end

  end
end
