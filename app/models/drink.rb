class Drink < ApplicationRecord
    has_many :storedrinks
    has_many :stores, through: :storedrink
end
