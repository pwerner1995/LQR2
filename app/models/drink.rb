class Drink < ApplicationRecord
    has_many :storedrinks
    has_many :stores, through: :storedrink
    validates :name, uniqueness: true, presence:true
    validates :price, presence: true

    def self.beers
        Drink.all.select do |drink|
            drink.category == "BEER"
        end.sort
    end

    def self.wines
        Drink.all.select do |drink|
            drink.category == "WINE"
        end
    end

    def self.liquors
        Drink.all.select do |drink|
            drink.category == "LIQUOR"
        end
    end

    def self.beer_search(params)
        self.where('name LIKE ? AND category = "BEER"', "%#{params[:name]}%")
    end

    def self.liquor_search(params)
        self.where('name LIKE ? AND category = "LIQUOR"', "%#{params[:name]}%")
    end

    def self.wine_search(params)
        self.where('name LIKE ? AND category = "WINE"', "%#{params[:name]}%")
    end

    def self.drink_search(params)
        self.where('name LIKE ?', "%#{params[:name]}%")
    end

    def stores
       @sd= StoreDrink.all.select do |sd|
            sd.drink == self   
       end
       @sd.map do |sd|
        sd.store
       end
    end

end
