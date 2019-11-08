class StoresController < ApplicationController
    
    def index
        @stores = Store.all
    end

    def show
        @store = Store.find(params[:id])
        @store_drinks = @store.store_drinks
    end

    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    def delete

    end
end
