# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding database Start"

ApplicationRecord.transaction do
  User.create(email: "admin@email.com", password: "123123")

  30.times do
    salary = Faker::Number.within(range: 1_000.0..6_000.0).floor(2)

    proponent = Proponent.create(
      name: Faker::Name.name,
      cpf: Faker::IdNumber.brazilian_citizen_number,
      birth_date: Faker::Date.birthday,
      salary:,
      discount: Salary.new(salary:).discount,
      address_attributes: {
        cep: Faker::Address.zip_code,
        street: Faker::Address.street_name,
        number: Faker::Address.building_number,
        city: Faker::Address.city,
        state: Faker::Address.state,
        neighborhood: "s/n"
      }
    )

    5.times do
      proponent.contacts.create(
        reference: true,
        name: Faker::Name.name,
        telephone: Faker::PhoneNumber.phone_number
      )
    end
  end

  puts "Seeding database End"
end
