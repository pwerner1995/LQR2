class Store < ApplicationRecord
    has_many :store_drinks
    has_many :drinks, through: :storedrinks 

    def store_drinks
        StoreDrink.all.select do |sd|
           sd.store_id == self.id
        end
    end

end
