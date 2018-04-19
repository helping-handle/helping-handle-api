class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    if user_signed_in? && current_user.admin?
      render json: Goal.includes(:user).all
    else
      render json: { msg: 'Action forbidden' }, status: 403
    end
  end


  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
