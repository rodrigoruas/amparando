module PagSeguro
  class Payment
    def initialize(date)
      @date = date.strftime("%F")
    end

    def to_json
      JSON.parse(api_request.body)
    end

    private

    def token
     token = Figaro.env.open_exchange_api_key
    end

    def api_request
      html = "https://openexchangerates.org/api/historical/#{@date}.json?app_id=#{token}"
      parsed_url = URI.parse(html)
      http = Net::HTTP.new(parsed_url.host, parsed_url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(parsed_url.request_uri)
      http.request(request)
    end
  end
end
