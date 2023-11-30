# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Delete existing records
ProductCategory.destroy_all
Product.destroy_all
Category.destroy_all

# Create categories
categories_array = ["E-Bike", "Storage", "Charger", "Battery", "Misc"]
categories_array.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Generate E-Bike products
100.times do
  product = Product.create!(
    name:        Faker::Vehicle.make_and_model,
    description: Faker::Lorem.paragraph,
    sale:        Faker::Boolean.boolean,
    category_id: Category.all.sample
  )
  # Assign a random category to the product
  category = Category.all.sample

  # Create a ProductCategory record for the product
  ProductCategory.create!(
    product_id:  product.id,
    category_id: category.id
  )
end

puts "#{Product.count} products created"
