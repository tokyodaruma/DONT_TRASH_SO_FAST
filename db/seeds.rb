require 'faker'
require 'open-uri'
require 'date'

puts 'Destroy previous seeds.'
Booking.destroy_all
Surplus.destroy_all
User.destroy_all
puts 'Planting new seeds.'

zach = User.new(email: 'fake@fake.com', password: '1111111')
zach.save

10.times do
  file = URI.open('https://loremflickr.com/320/240/vegetable')
  surplus = Surplus.create!(
    category: Surplus.categories.keys.sample,
    name: Faker::Food.vegetables,
    description: 'Hope to find a happy plate for these ingredients',
    location: ['Meguro, Tokyo', 'Kamata, Tokyo', 'Nagoya, Aichi', 'Sapporo, Hokkaido', 'Matsumoto, Nagano'].sample,
    user: zach,
    quantity: rand(1..200)
  )
  surplus.photo.attach(io: file, filename: 'leftovers.png', content_type: 'image/png')
  puts 'creating new surplus entry'
end

10.times do
  Booking.create!(
    date: Date.today + rand(1..10),
    status: Booking.statuses.keys.sample,
    user: zach,
    surplus_id: Surplus.all.sample.id
  )
  puts 'creating new booking entry based on user and surplus'
end
