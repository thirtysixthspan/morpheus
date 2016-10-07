module Morpheus

  class ErrorHandler < Praxis::ErrorHandler

    def handle!(request, error)

      case error
      when Morpheus::ParseError
        response = Praxis::Responses::BadRequest.new
      else
        return super(request, error)
      end

      response.request = request
      response.finish
    end

  end

end
