puts "Cleaning database"
Restaurant.destroy_all

puts "Creating restaurants..."

10.times do
  restaurant = Restaurant.new(
    name: Faker::Book.title,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    )
  restaurant.save!
end

puts "Finished!"
