module V1
  module MediaTypes

    class Metadata < Praxis::MediaType

      identifier 'application/json'
      description 'This is metadata response that describes a message'

      attributes do
        attribute :mentions, Attributor::Collection.of(String),
          description: 'Names of users mentioned in the message',
          example: ['chris', 'bob', 'peter']
        attribute :emoticons, Attributor::Collection.of(String),
          description: 'Names of emoticons mentioned in the message',
          example: ['party', 'success', 'happyjoy']
        attribute :links, Attributor::Collection.of(Link),
          description: 'Links mentioned in the message'
      end

      view :default do
        attribute :mentions
        attribute :emoticons
        attribute :links
      end

    end

  end
end
