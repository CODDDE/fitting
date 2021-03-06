require 'json'

module Fitting
  class Records
    class Spherical
      class Response
        attr_reader :status, :body

        def initialize(status:, body:)
          @status = status
          @body = body
        end

        def to_hash
          {
            status: status,
            body: JSON.load(body)
          }
        rescue JSON::ParserError
          {
            status: status,
            body: {}
          }
        end

        def to_json
          JSON.dump(to_hash)
        end

        class << self
          def load(hash)
            new(status: hash['status'], body: hash['body'])
          end
        end
      end
    end
  end
end
