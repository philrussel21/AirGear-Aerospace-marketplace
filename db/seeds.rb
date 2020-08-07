# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



## Seeds file currently not populate production db
## TODO Populate database using FakerGem

# populate Category Table
categories = ["Avionics",
              "Aeroparts",
              "Consumables",
              "Training",
              "Safety",
              "Crew",
              "GSE"]

top_currencies = ["AUD", "BHD", "OMR", "GBP", "KYD", "EUR", "CHF", "USD", "CAD", "SGD"]


categories.each do |category|
  Category.create(name: category)
end


#populate Accounts Table
25.times do
  name = Faker::Company.unique.name
  address = Faker::Address
  a = Account.create(company_name: Faker::Company.unique.name,
                      email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@email",
                      password: "password123")

  a.profile = Profile.create(country: address.country, 
                              street: address.street_address,
                              suburb: address.street_name,
                              state: address.state,
                              postcode: address.postcode,
                              website: Faker::Internet.domain_name(subdomain: true, domain: "company"),
                              contact: Faker::PhoneNumber.phone_number_with_country_code)
  # a.profile.picture.attach(io: File.open(Faker::Company.logo))
  arr = [1,2,3,4,5]
  category = Category.all
  a.listings.create(category: category[arr.sample],
                part_num: Faker::Alphanumeric.alphanumeric(number: 10, min_numeric: 7),
                part_name: Faker::ElectricalComponents.active,
                selling_price: Faker::Number.within(range: 1000..10000),
                currency: top_currencies.sample,
                condition: arr.sample,
                description: Faker::ElectricalComponents.active + " " + Faker::Company.bs,
                quantity: Faker::Number.within(range: 1..50)
              )
end
