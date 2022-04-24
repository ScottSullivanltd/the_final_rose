class Outing < ApplicationRecord
  has_many :outing_contestants
  has_many :contestants, through: :outing_contestants
end
