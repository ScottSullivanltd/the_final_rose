class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :outing_contestants
  has_many :outings, through: :outing_contestants
end
