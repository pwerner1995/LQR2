class ApplicationController < ActionController::Base

  helper_method :loggedin?


    def root 
        @drinks = Drink.all.sort{ |a, b| a.name <=> b.name }
        redirect_to home_path
    end

    def home
      @drinks = Drink.all.sort{ |a, b| a.name <=> b.name }
    end

    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      end
    end

    def loggedin?
      !!current_user
    end

    def authorize
      redirect_to login_path unless loggedin?
    end
end
