require 'faker'
require 'open-uri'

puts 'Destroy previous seeds.'
Booking.destroy_all
Surplus.destroy_all
puts 'Planting new seeds.'

10.times do
  file = URI.open('https://loremflickr.com/320/240/bread')
  surplus = Surplus.create!(
    category: Surplus.categories.keys.sample,
    description: Faker::Food.description,
    location: ['Meguro, Tokyo', 'Kamata, Tokyo', 'Nagoya, Aichi', 'Sapporo, Hokkaido', 'Matsumoto, Nagano'].sample,
    user_id: 1,
    quantity: rand(1..10)
  )
  surplus.photo.attach(io: file, filename: 'leftovers.png', content_type: 'image/png')
  puts 'creating new surplus entry'
end

10.times do
  Booking.create!(
    date: rand(1..14),
    status: Booking.statuses.keys.sample,
    user_id: 1,
    surplus_id: Surplus.all.sample.id
  )
  puts 'creating new booking entry based on user and surplus'
end
