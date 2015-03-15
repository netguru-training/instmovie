module Instagram
  class UpdateProfileInfoService
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
      fail NotImplementedError, 'not implemented yet'
    end

    def update_avatar!
      fail NotImplementedError, 'not implemented yet'
    end
  end
end
