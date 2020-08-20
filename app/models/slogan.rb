class Slogan < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true
    validates :slogan, presence: true
end
