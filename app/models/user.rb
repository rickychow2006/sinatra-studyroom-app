class User < ActiveRecord::Base 
    has_secure_password

    validates :name, presence: true 
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :studyposts 

end 