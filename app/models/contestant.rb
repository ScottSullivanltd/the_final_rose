class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :outing_contestants
  has_many :outings, through: :outing_contestants

  def self.unique_hometowns
    pluck(:hometown).uniq
  end
end
