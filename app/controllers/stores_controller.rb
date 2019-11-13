class StoresController < ApplicationController
    
    def index
        @stores = Store.all
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params) 
        @store.update(user_id: session[:user_id])
        if @store.save
            redirect_to store_path(@store)
        else 
            flash[:errors] = @store.errors.full_messages
            render :new
        end
    end

    def show
        @store = Store.find(params[:id])
        @store_drinks = @store.store_drinks
        @store_drink = StoreDrink.new
        @drinks = Drink.all
        @drink = Drink.new 
        
    end

    def store_search
        @search_results = Store.store_search(search_params)
        render :store_search_results
    end

    def inventory
        @stores = Store.your_stores(session[:user_id])
    end

    def inventory_search 
        @search_results = Store.inventory_search(inventory_search_params)
        render :inventory_search_results
    end 

    private

    def store_params
        params.require(:store).permit(:name, :location)
    end

    def search_params
        params.permit(:name)
    end

    def inventory_search_params
        params.permit(:name, :user_id)
    end

end
