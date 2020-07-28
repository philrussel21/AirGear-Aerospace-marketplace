# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# populate Category Table
categories = ["Avionics",
              "Aeroparts",
              "Consumables",
              "Training",
              "Safety",
              "Crew",
              "GSE"]

categories.each do |category|
  Category.create(name: category)
end


# populate Accounts Table
10.times do |i|
  a = Account.create(company_name: "Test Company #{i+1}", email: "test#{i+1}@email", password: "password123")
  a.profile = Profile.create
  sample = [1,2,3,4,5].sample
  category = Category.all
  conditions = Listing.conditions.keys
  a.listings.create(category: category[sample],
                part_num: i,
                part_name: "PartName#{i+1}",
                selling_price: "100#{i}",
                currency: "AUD",
                condition: sample
              )
end
