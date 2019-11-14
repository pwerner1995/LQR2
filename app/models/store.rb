class Store < ApplicationRecord
    has_many :store_drinks
    has_many :drinks, through: :storedrinks 
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true

    def store_drinks
        StoreDrink.all.select do |sd|
           sd.store_id == self.id
        end
    end

    def self.store_search(params)
        self.where('name LIKE ?', "%#{params[:name]}%")
    end

    def self.your_stores(user)
        Store.all.select do |store|
            store.user_id == user
        end
    end

    def self.inventory_search(params)
        self.where('name LIKE ? AND user_id = ?', "%#{params[:name]}%", "#{params[:user_id]}")
    end

    def api
        client = GoogleSearchResults.new(q:"#{self.name} liqour", tbm:"isch", serp_api_key: "e35522f2e24cc87ff79ad525763b1e0ed3983f19c268a2750c65eb7f1444d1d6")
        hash_results = client.get_hash
        self.update(image: hash_results[:images_results][0][:thumbnail])
    end

    def self.api     
        Store.all.each do |store|
            client = GoogleSearchResults.new(q:"#{store.name} liqour", tbm:"isch", serp_api_key: "e35522f2e24cc87ff79ad525763b1e0ed3983f19c268a2750c65eb7f1444d1d6")
            hash_results = client.get_hash
            store.update(image: hash_results[:images_results][0][:thumbnail])

        end
    end

end
