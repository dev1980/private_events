# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'with 1 event' do
    user = User.create(name: 'asdcsacs')
    event = user.created_events.build(title: 'This is a test title',
                                      description: 'This is a test description',
                                      date: Date.today,
                                      location: 'Nepal')
    it 'checks if an event with no title is invalid' do
      event.title = nil
      expect(event.valid?).to eq(false)
    end

    it 'checks if an event with no description is invalid' do
      event.description = nil
      expect(event.valid?).to eq(false)
    end

    it 'checks if an event with no date is invalid' do
      event.date = nil
      expect(event.valid?).to eq(false)
    end

    it 'checks if an event with no location is invalid' do
      event.location = nil
      expect(event.valid?).to eq(false)
    end
  end

  context 'with 1 event and some users' do
    it 'checks if an event must have one creator' do
      user = User.create(name: 'Dev')
      event = user.created_events.create(title: 'This is a test title',
                                         description: 'This is a test description',
                                         date: Date.today,
                                         location: 'Nepal')
      expect(event.creator.name).to eq('Dev')
    end

    it 'checks if an event can have multiple attendees' do
      user = User.create(name: 'Dev')
      event = user.created_events.create(title: 'This is a test title',
                                         description: 'This is a test description',
                                         date: Date.today,
                                         location: 'Nepal')

      attendee1 = User.create(name: 'Miguel')
      attendee2 = User.create(name: 'Bhram')

      attending1 = attendee1.attendings.create(event_id: event.id)
      attending2 = attendee2.attendings.create(event_id: event.id)

      expect(event.attendees).to eq([attendee1, attendee2])
      expect(event.attendings).to eq([attending1, attending2])
    end
  end
end
