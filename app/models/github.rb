module Github

  class Client
    include HTTParty
    base_uri "https://api.github.com"

    def zen(access_token)
      headers = { "User-Agent" => "liorrm" }
      response = self.class.get('/zen', :query => { :access_token => access_token }, headers: headers)
      if response.headers['status'] == "403 Forbidden"
        Quote.rand_quote
      else
        p response
        Quote.create(quotes: response.body)
      end
    end

  end

end