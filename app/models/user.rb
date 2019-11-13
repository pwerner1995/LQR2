class User < ApplicationRecord
    has_many :stores
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false }, presence: true

    def store_name
        self.stores.create
    end

    def location
        self.store.update
    end

end
