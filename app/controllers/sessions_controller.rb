# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :not_logged_in_users, only: %i[new create]
  before_action :only_logged_in_users, only: :destroy

  def new; end

  def create
    @current_user = User.find_by(name: params[:session][:name])
    login(@current_user)
    redirect_to @current_user
  end

  def destroy
    logout
    redirect_to root_path
  end
end
