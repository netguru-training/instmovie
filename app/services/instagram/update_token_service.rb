module Instagram
  class UpdateTokenService
    def initialize(user, payload)
      @user = user
      @payload = payload
    end

    def call
      update_token!
    end

    private

    def update_token!
      fail NotImplementedError, 'not implemented yet'
    end

    def fetch_token
      @payload['omniauth.auth']['credentials']['token']
    end
  end
end
