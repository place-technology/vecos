module Vecos
  class Session
    Log = ::Log.for(self)

    property single_request_timeout : Int32 = Constants::DEFAULT_SINGLE_REQUEST_TIMEOUT
    property user_agent : String = ["Vecos", Constants::VERSION].join(" ")
    property access_token : OAuth2::AccessToken

    private property client : Halite::Client = Halite::Client.new

    def initialize(@access_token : OAuth2::AccessToken)
    end

    def request(method : String, url : String, **kwargs) : Halite::Response
      absolute_url = URI.parse("https://acc-sapi.releezme.net").resolve(url).to_s

      @client.headers({"Authorization" => ["Bearer", access_token.access_token].join(" ")})

      @client.headers({"User-Agent" => @user_agent})
      @client.headers({"Content-Type" => "application/json"})

      @client.timeout single_request_timeout

      Log.debug { "Requesting an URL..." }
      Log.debug { "Request method: #{method}" }
      Log.debug { "Request URL: #{url}" }
      Log.debug { "Request keyword arguments: #{kwargs}" }

      case method
      when "GET"
        response = @client.get absolute_url, **kwargs
      when "POST"
        response = @client.post absolute_url, **kwargs
      when "PUT"
        response = @client.put absolute_url, **kwargs
      when "DELETE"
        response = @client.delete absolute_url, **kwargs
      else
        raise Exception.new("The request-method type is invalid.")
      end

      Log.debug { "Request response status code: #{response.status_code}" }
      Log.debug { "Request response body: #{response.body}" }

      raise Exception.new(Constants::STATUS_CODES[response.status_code]) if (300..599).includes?(response.status_code)

      response
    end

    def get(url : String, **kwargs) : Halite::Response
      request("GET", url, **kwargs)
    end

    def post(url : String, **kwargs) : Halite::Response
      request("POST", url, **kwargs)
    end

    def put(url : String, **kwargs) : Halite::Response
      request("PUT", url, **kwargs)
    end

    def delete(url : String, **kwargs) : Halite::Response
      request("DELETE", url, **kwargs)
    end
  end
end
