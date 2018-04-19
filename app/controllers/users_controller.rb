class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    if user_signed_in? && current_user.admin?
      render json: User.all
    else
      render json: { msg: 'Action forbidden' }, status: :forbidden
    end
  end

  def show
    if user_signed_in? && current_user.admin?
      render json: @user
    else
      render json: @user, :only => [:id, :handle]
    end
  end

  def update
    if !user_signed_in? || @user != current_user
      render json: { msg: 'Action forbidden' }, status: :forbidden
    elsif @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :description, :email, :handle_cash, :handle_venmo,
      :handle_paypal)
  end
end
