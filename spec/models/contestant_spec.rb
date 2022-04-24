require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it { should belong_to :bachelorette }
    it { should have_many :outing_contestants }
    it { should have_many(:outings).through(:outing_contestants) }
  end
end
