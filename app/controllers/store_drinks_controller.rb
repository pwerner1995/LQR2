class StoreDrinksController < ApplicationController

    def create
        @store_drink = StoreDrink.create(store_drink_params)
        @store = Store.find(@store_drink.store_id)
        redirect_to store_path(@store)  
    end

    def delete
        @store_drink = StoreDrink.find(params[:id])
        @store = Store.find(@store_drink.store_id)
        @store_drink.destroy
        redirect_to store_path(@store)
    end

    private

    def store_drink_params
        params.require(:store_drink).permit(:drink_id, :store_id)
    end
end
