require 'faraday'
require 'faraday_middleware'

class EspertoFitPersonal
  class << self
    def endpoint
      Rails.configuration.esperto_fit_personal[:base_url]
      # "http://localhost:4000"
    end

    def api_version
      'v1'
    end

    def personal_url
      "#{endpoint}/api/#{api_version}"
    end

    def client
      @client ||= new_connection
    end

    private

    def new_connection
      Faraday.new(url: personal_url) do |faraday|
        faraday.use :instrumentation
        faraday.headers['Content-Type'] = 'application/json'

        faraday.response :json, parser_options: { symbolize_names: true },
                                content_type: /\bjson$/
        faraday.adapter :net_http
      end
    end
  end
end