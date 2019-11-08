class StoreDrink < ApplicationRecord
    belongs_to :store 
    belongs_to :drink 
end
