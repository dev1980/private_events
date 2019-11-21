class ApplicationController < ActionController::Base
    def login(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logout
        session.delete(:user_id)
        @current_user = nil
    end

end