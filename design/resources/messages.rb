module V1
  module ApiResources

    class Message
      include Praxis::ResourceDefinition

      media_type V1::MediaTypes::Metadata
      version '1'

      prefix '/message'

      action :parse do
        routing { post '/parse' }
        payload do
          attribute :source, String,
            required: true,
            description: 'A text message with markup',
            example: '@bob @john (success) such a cool feature!'
        end
        description 'Parse a message and return a metadata response'
      end

    end

  end
end
