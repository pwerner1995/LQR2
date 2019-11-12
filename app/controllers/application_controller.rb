class ApplicationController < ActionController::Base

    def root 
        @drinks = Drink.all.sort{ |a, b| a.name <=> b.name }
        redirect_to home_path
    end

    def home
      @drinks = Drink.all.sort{ |a, b| a.name <=> b.name }
    end

end
