# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

Author.destroy_all
Publisher.destroy_all
Genre.destroy_all

10.times do
  author = Author.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
  )

  publisher = Publisher.create(
    name: Faker::Book.publisher,
  )

  genre = Genre.create(
    genre_name: Faker::Book.genre,
  )
end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
