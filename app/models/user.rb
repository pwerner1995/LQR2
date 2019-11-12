class User < ApplicationRecord
    has_many :stores
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false }, presence: true
    
end
