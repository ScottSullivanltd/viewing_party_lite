require "rails_helper"

RSpec.describe Person, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
    # it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe "relationships" do
    it { should have_many(:party_people) }
    it { should have_many(:parties).through(:party_people) }
  end
end
