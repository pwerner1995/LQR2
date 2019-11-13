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

end
