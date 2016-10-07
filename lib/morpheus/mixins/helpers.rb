module Morpheus

  module Helpers

    def pipe(data, operations)
      operations.inject(data) { |accumulator, operation| method(operation).call(accumulator) }
    end

    def merge(hash, attributes)
      attributes.each_with_object(hash) { |(key, value), accumulator|
        accumulator[key] = value if value.present?
      }
    end

    def with_retries(n, errors)
      tries ||= 0
      yield if block_given?
    rescue *errors
      tries += 1
      if tries < n
        sleep n * n / 10.0
        retry
      end
      nil
    end

  end

end
