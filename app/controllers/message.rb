module V1

  class Message
    include Praxis::Controller
    include Morpheus::Helpers

    implements V1::ApiResources::Message

    def parse
      pipe(request.payload.source, [
        :create_metadata,
        :create_openstruct,
        :render_body,
        :render_response
      ])
    end

    private

    def create_metadata(message)
      Morpheus::Metadata.new(message)
    end

    def create_openstruct(metadata)
      OpenStruct.new(metadata.to_h)
    end

    def render_body(openstruct)
      MediaTypes::Metadata.new(openstruct).render(view: :default)
    end

    def render_response(body)
      Praxis::Responses::Ok.new(body: body)
    end

  end

end
