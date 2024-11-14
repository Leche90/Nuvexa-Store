# db/seeds.rb

# Clear existing data
Category.destroy_all
Product.destroy_all
Customer.destroy_all

# Seed Categories
category_names = ["Home Decor", "Personal Care", "Eco-Friendly Cleaning", "Sustainable Clothing"]
categories = category_names.map do |name|
  Category.create(name: name, description: Faker::Lorem.sentence)
end

puts "Created #{Category.count} categories."

# Seed Products
100.times do
  product = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 10.0..200.0),
    stock_quantity: rand(1..50),
    created_at: Faker::Date.backward(days: 365),
    updated_at: Faker::Date.backward(days: 30)
  )
  
  # Randomly assign categories to each product
  product.categories << categories.sample(rand(1..2))
end

puts "Created #{Product.count} products with categories."

# Seed Customers
50.times do
  Customer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: 'password123', # Default password for demonstration
    created_at: Faker::Date.backward(days: 365),
    updated_at: Faker::Date.backward(days: 30)
  )
end

puts "Created #{Customer.count} customers."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?