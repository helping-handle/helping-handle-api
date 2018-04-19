class SessionsController < Devise::SessionsController
  def create
    super {
      @token = current_token
      @user = current_user
    }
  end

  def show
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
