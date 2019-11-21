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

    def only_logged_in_users
        return if current_user

        redirect_to login_path
    end

    def not_logged_in_users
        return unless current_user

        redirect_to login_path
    end
end
