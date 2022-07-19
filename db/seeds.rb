require 'faker'

puts 'Planting new seeds'

zach = User.new(email: 'zach@rails.com', password: 'testing')
zach.save

p 'Welcome Zach!'

10.times do
  Surplus.create!(
    category: rand(1..5),
    description: Faker::Food.description,
    location: ['Meguro, Tokyo', 'Kamata, Tokyo', 'Nagoya, Aichi', 'Sapporo, Hokkaido', 'Matsumoto, Nagano'].sample,
    user_id: zach.id,
    quantity: rand(1..10)
  )
  puts 'creating new surplus entry'
end

10.times do
  Booking.create!(
    date: rand(1..14),
    status: %i[pending accepted rejected].sample,
    user_id: zach.id,
    surplus_id: Surplus.all.sample.id
  )
  puts 'creating new booking entry based on user and surplus'
end
