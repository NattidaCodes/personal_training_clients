class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { in: 8..20 }
    
    has_many :clients
end