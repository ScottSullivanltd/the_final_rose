require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationship" do
    it { should have_many :outing_contestants }
    it { should have_many(:contestants).through(:outing_contestants) }
  end
end
