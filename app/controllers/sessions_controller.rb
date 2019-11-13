class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(username: params[:username])
        # if session[:store_name]
        #     @store = Store.create(name: session[:store_name], location: session[:location], user_id: user.id)
        #     if @store.erorrs
        #         flash[:errors] = @store.errors.full_messages
              
        #         redirect_to add_store_path
        #     end
        # end

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to home_path
        else 
            flash.alert = ["Incorrect username or password"]
            redirect_to login_path
        end
    end

    def delete
        session[:user_id] = nil
        redirect_to home_path
    end


end