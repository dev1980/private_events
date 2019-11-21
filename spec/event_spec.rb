require "rails_helper"

RSpec.describe Event, :type => :model do
  context "with 1 event" do
    user = User.create(name: 'asdcsacs')
    event = user.created_events.build(title: 'This is a test title',
                                       description: 'This is a test description',
                                       date: Date.today,
                                       location: 'Nepal')
    it "checks if an event with no title is invalid" do
      event.title = nil
      expect(event.valid?).to eq(false)
    end

    it "checks if an event with no description is invalid" do
      event.description = nil
      expect(event.valid?).to eq(false)
    end

    it "checks if an event with no date is invalid" do
      event.date = nil
      expect(event.valid?).to eq(false)
    end

    it "checks if an event with no location is invalid" do
      event.location = nil
      expect(event.valid?).to eq(false)
    end
  end
end