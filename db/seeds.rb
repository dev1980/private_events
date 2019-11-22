# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do
  User.create(name: Faker::Name.name)
end

users = User.take(5)
users.each do |user|
  10.times do |i|
    event = user.created_events.create(title: Faker::Lorem.sentence(word_count: 3),
                                      description: Faker::Lorem.paragraph,
                                      location: Faker::Nation.capital_city,
                                      date: [-i,i].sample.days.ago)
    attendees = User.all.sample(5)
    attendees.each do |attendee|
      attendee.attendings.create(event_id:event.id)
    end
  end
end