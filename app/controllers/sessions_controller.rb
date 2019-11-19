class SessionsController < ApplicationController
  def new
    
  end

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
