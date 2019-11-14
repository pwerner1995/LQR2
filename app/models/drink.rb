require 'google_search_results'
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

    def api
        client = GoogleSearchResults.new(q:"#{self.name} liquor", tbm:"isch", serp_api_key: "e35522f2e24cc87ff79ad525763b1e0ed3983f19c268a2750c65eb7f1444d1d6")
        hash_results = client.get_hash
        self.update(image: hash_results[:images_results][0][:thumbnail])
    end


    def self.api     
        Drink.all.each do |drink|
            client = GoogleSearchResults.new(q:"#{drink.name}", tbm:"isch", serp_api_key: "e35522f2e24cc87ff79ad525763b1e0ed3983f19c268a2750c65eb7f1444d1d6")
            hash_results = client.get_hash
            drink.update(image: hash_results[:images_results][0][:thumbnail])

        end
    end
end
