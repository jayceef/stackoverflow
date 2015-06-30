module Github
  class Client
    include HTTParty

    base_uri "https://api.github.com"

    def initialize(token)
      @token = "token #{token}"
      @user_agent = 'DBCOverflow'
      @headers = { "User-Agent" => @user_agent, "Authorization" => @token }
    end

    def zen
      response = self.class.get("/zen", headers: @headers)
    end
  end
end
