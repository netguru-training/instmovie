module Instagram
  class UpdateInstagramProfileInfoService
    def initialize(user, payload)
      @user = user
      @payload = payload
    end

    def call
      update_nickname!
      update_avatar!
    end

    private
    def update_nickname!
      @user.update(username: fetch_nickname)
    end

    def update_avatar!
      @user.update(avatar: fetch_avatar)
    end

    def fetch_nickname
      @payload['info']['nickname']
    end

    def fetch_avatar
      @payload['info']['image']
    end
  end
end