class Hero < ApplicationRecord
    validates :name, presence:true
    validates :super_name, presence:true

    has_many :hero_powers
    has_many :powers, through: :hero_powers
end
