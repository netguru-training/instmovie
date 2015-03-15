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
      @user.update(access_token: fetch_token)
    end

    def fetch_token
      @payload['credentials']['token']
    end
  end
end
