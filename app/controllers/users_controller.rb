class UsersController < ApplicationController

    def new
    @user = User.new
    end
  
    def create
    @user = User.new(user_params)
        if @user.save
        redirect_to login_path
        else 
        flash[:errors] = @user.errors.full_messages
        redirect_to new_user_path
        end
    end
    
    def create_store
       @user = User.find(params[:id])
    end

    def add_store
        session[:store_name] = params[:store_name]
        session[:location] = params[:location]
      
        redirect_to login_path
    end     

    private 

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end


    
end