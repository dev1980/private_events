# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with 1 user' do
    it 'checks if a user with no name is invalid' do
      user = User.new
      expect(user.valid?).to eq(false)
    end

    it 'checks if a user with name is valid' do
      user = User.new(name: 'Bhram Dev')
      expect(user.valid?).to eq(true)
    end
  end

  context 'with 1 user that created 1 event' do
    it 'checks if a user can create mulitple events' do
      user = User.create(name: 'Dev')
      event1 = user.created_events.create(title: 'This is a test title',
                                          description: 'This is a test description',
                                          date: Date.today,
                                          location: 'Nepal')

      event2 = user.created_events.create(title: 'This is a test title for second event',
                                          description: 'This is a test description for second event',
                                          date: Date.today,
                                          location: 'Bogota')

      expect(user.created_events).to eq([event2, event1])
    end

    it 'checks if a user can attend multiple events' do
      user = User.create(name: 'Dev')
      event1 = user.created_events.create(title: 'This is a test title',
                                          description: 'This is a test description',
                                          date: Date.today,
                                          location: 'Nepal')

      event2 = user.created_events.create(title: 'This is a test title for second event',
                                          description: 'This is a test description for second event',
                                          date: Date.today,
                                          location: 'Bogota')

      attendee = User.create(name: 'Miguel')
      attending1 = attendee.attendings.create(event_id: event1.id)
      attending2 = attendee.attendings.create(event_id: event2.id)

      expect(attendee.attended_events).to eq([event2, event1])
      expect(attendee.attendings).to eq([attending1, attending2])
    end
  end
end
