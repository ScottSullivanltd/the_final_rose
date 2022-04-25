class Bachelorette < ApplicationRecord
  has_many :contestants

  def contestants_avg_age
    contestants.average(:age)
  end
end
