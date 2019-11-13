class DrinksController < ApplicationController

    def index
        @drinks = Drink.all.sort{ |a, b| a.name <=> b.name }
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
        @store_drink = StoreDrink.new
        if session[:user_id]
            @user = User.find(session[:user_id])
            @stores = @user.stores
        end
        
    end

    def beers
        @beers = Drink.beers.sort{ |a, b| a.name <=> b.name }
    end

    def wines
        @wines= Drink.wines.sort{ |a, b| a.name <=> b.name }
    end

    def liquors
        @liquors = Drink.liquors.sort{ |a, b| a.name <=> b.name }
    end

    def liquor_search
        @search_results = Drink.liquor_search(search_params)
        render :liquor_search_results
    end

    def beer_search
        @search_results = Drink.beer_search(search_params)
        render :beer_search_results
    end

    def wine_search
        @search_results = Drink.wine_search(search_params)
        render :wine_search_results
    end

    def drink_search
        @search_results = Drink.drink_search(search_params)
        render :drink_search_results
    end
    
    private
    def drink_params
        params.require(:drink).permit(:name, :price)
    end

    def search_params
        params.permit(:name)
    end


end
