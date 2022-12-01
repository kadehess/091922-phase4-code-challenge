class HeroPower < ApplicationRecord
  validates :strength, inclusion: { in: %w(Weak Average Strong),
  message: "%{value} is not a valid strength" }
belongs_to :hero
belongs_to :power
end
