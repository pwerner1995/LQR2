class StoresController < ApplicationController
    
    def index
        @stores = Store.all
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
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

    def edit

    end

    def update

    end

    def delete

    end

    def store_search
        @search_results = Store.store_search(search_params)
        render :store_search_results
    end

    private

    def store_params
        params.require(:store).permit(:name, :location)
    end

    def search_params
        params.permit(:name)
    end

end
