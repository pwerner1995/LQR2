class DrinksController < ApplicationController

    def index
        @drinks = Drink.all 
    end

    def new
        @drink = Drink.new
    end

    def create
        @drink = Drink.new(drink_params)
        if @drink.save
            redirect_to drink_path(@drink)
        else 
            flash[:errors] = @drink.errors.full_messages
            render :new
        end
    end

    def show 
        @drink = Drink.find(params[:id])  
    end

    private

    def drink_params
        params.require(:drink).permit(:name, :price)
    end
end
