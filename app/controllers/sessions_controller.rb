class SessionsController < Devise::SessionsController
  def create
    super { @token = current_token }
  end

  def show
    @user = current_user
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
