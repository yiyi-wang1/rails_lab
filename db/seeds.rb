# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
User.destroy_all

40.times do
    created_time = Faker::Date.backward(days:365 * 2)
    Product.create(
        title: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        price: Faker::Commerce.price,
        created_at: created_time,
        updated_at: created_time
    )

    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        created_at: created_time,
        updated_at: created_time
    )
end

products = Product.all
users = User.all

puts Cowsay.say("Generated #{products.count} products and #{users.count} users", :cow)
