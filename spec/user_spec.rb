require "rails_helper"

RSpec.describe User, :type => :model do
  context "with 1 user" do
    it "checks if a user with no name is invalid" do
      user = User.new
      expect(user.valid?).to eq(false)
    end

    it "checks if a user with name is valid" do
      user = User.new(name: 'Bhram Dev')
      expect(user.valid?).to eq(true)
    end
  end
end