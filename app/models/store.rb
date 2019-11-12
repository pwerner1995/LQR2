class Store < ApplicationRecord
    has_many :store_drinks
    has_many :drinks, through: :storedrinks 
    validates :name, presence: true
    validates :location, presence: true, uniqueness:true

    def store_drinks
        StoreDrink.all.select do |sd|
           sd.store_id == self.id
        end
    end

    def self.store_search(params)
        self.where('name LIKE ?', "%#{params[:name]}%")
    end

end
