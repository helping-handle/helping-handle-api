class SessionsController < Devise::SessionsController
  def create
    super { @token = current_token }
  end

  def show
    unless user_signed_in?
      render json: { msg: 'You are not logged in' }, status: 403
    end
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
