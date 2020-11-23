module SessionsHelper
# Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

#Determines if user is login or not
    def logged_in?
        !current_user.nil?
    end

#In order to get who are the users 
#that are currently online you need
#current_user, for eg. when you make a tweet

    # include current_user
# Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end
# Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def only_loggedin_users
        redirect_to login_url unless logged_in? 
    end

    #log outs the current user....
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end