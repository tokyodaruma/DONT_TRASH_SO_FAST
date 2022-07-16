require 'faker'

puts 'Wiping database'
Surplus.destroy_all
Booking.destroy_all
User.destroy_all
puts 'Planting new seeds'

10.times do
  zach = User.new(email: 'zach@rails.com', password: 'testing')
  zach.save
  p zach.id
  Surplus.create!(
    category: ['Japanese', 'Chinese', 'German', 'French', 'American'].sample,
    description: Faker::Food.description,
    location: ['Meguro, Tokyo', 'Kamata, Tokyo', 'Nagoya, Aichi', 'Sapporo, Hokkaido', 'Matsumoto, Nagano'].sample,
    user_id: zach.id,
    quantity: rand(1..10)
  )
  puts 'creating new surplus entry'
end
