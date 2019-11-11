class Drink < ApplicationRecord
    has_many :storedrinks
    has_many :stores, through: :storedrink
    validates :name, uniqueness: true, presence:true
    validates :price, presence: true
end
