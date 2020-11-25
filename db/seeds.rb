require "faker"

Restaurant.destroy_all

5.times do
  resto = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample
  )
  resto.save
end
