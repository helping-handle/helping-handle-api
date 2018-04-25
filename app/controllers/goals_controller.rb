class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show update destroy toggle_favorite]

  def index
    @goals = if params[:user_id].present?
               Goal.joins(:user).where(user_id: params[:user_id])
             else
               Goal.joins(:user)
             end

    if params[:q]
      q = "%#{params[:q]}%"
      @goals = @goals.where('goals.name like ? OR desc like ? OR users.handle like ?', q, q, q)
    end
  end

  def show
    render json: @goal
  end

  def create
    if user_signed_in?
      @goal = current_user.goals.build(goal_params)

      if @goal.save
        render json: @goal, status: :created, location: @goal
      else
        render json: @goal.errors, status: :unprocessable_entity
      end
    else
      render json: { msg: 'Action forbidden' }, status: :forbidden
    end
  end

  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
  end

  def toggle_favorite
    if user_signed_in?
      if @goal.favorite.nil?
        @goal.build_favorite(user: current_user).save
        head 201
      else
        @goal.favorite.destroy
        head 200
      end
    else
      render json: { msg: 'Action forbidden' }, status: :forbidden
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goal
    @goal = Goal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def goal_params
    params.require(:goal).permit(:user_id, :name, :description, :amount, :posted, :public, :deleted)
  end
end
