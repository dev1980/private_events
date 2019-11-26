# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :not_logged_in_users, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return unless @user.save

    login(@user)
    redirect_to @user
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
