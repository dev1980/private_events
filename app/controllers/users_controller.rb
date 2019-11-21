class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user 
    end
  end

  def show
    @user = User.includes(:created_events, :attended_events).find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
