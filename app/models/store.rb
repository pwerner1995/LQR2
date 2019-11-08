class Store < ApplicationRecord
    has_many :store_drinks
    has_many :drinks, through: :storedrinks 
end
