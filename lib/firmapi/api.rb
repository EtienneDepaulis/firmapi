module Firmapi
  class API

    def get(url, params)
      params = default_params.merge params

      connexion.get api_url(url), params
    end

    private

      def connexion
        @connexion ||= Faraday.new(url: 'https://firmapi.com') do |faraday|
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
      end

      def default_params
        { api_key: Firmapi.configuration.api_key }
      end

      def api_url(url)
        "/api/v1#{url}"
      end

  end
end