# Delete existing records
User.destroy_all
Province.destroy_all
ContactPage.destroy_all
ProductCategory.destroy_all
Product.destroy_all
Category.destroy_all

# Create categories
categories_array = ["E-Bike", "Storage", "Charger", "Battery", "Misc"]
categories_array.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Create Contact Page
ContactPage.create!(
  title:   "Contact Us",
  content: "Please feel free to contact us for any inquiries or support."
)

# Create provinces
provinces_data = [
  { name: "Alberta", gst: 0.05, hst: nil, pst: nil },
  { name: "British Columbia", gst: 0.05, hst: nil, pst: 0.07 },
  { name: "Manitoba", gst: 0.05, hst: nil, pst: 0.07 },
  { name: "New Brunswick", gst: nil, hst: 0.15, pst: nil },
  { name: "Newfoundland and Labrador", gst: nil, hst: 0.15, pst: nil },
  { name: "Northwest Territories", gst: 0.05, hst: nil, pst: nil },
  { name: "Nova Scotia", gst: nil, hst: 0.15, pst: nil },
  { name: "Nunavut", gst: 0.05, hst: nil, pst: nil },
  { name: "Ontario", gst: nil, hst: 0.13, pst: nil },
  { name: "Prince Edward Island", gst: nil, hst: 0.15, pst: nil },
  { name: "Quebec", gst: 0.05, hst: nil, pst: 0.09975 },
  { name: "Saskatchewan", gst: 0.05, hst: nil, pst: 0.06 },
  { name: "Yukon", gst: 0.05, hst: nil, pst: nil }
]

provinces_data.each do |province_data|
  Province.create!(province_data)
end

# Generate E-Bike products
100.times do
  product = Product.create!(
    name:        Faker::Vehicle.make_and_model,
    description: Faker::Lorem.paragraph,
    sale:        Faker::Boolean.boolean,
    category_id: Category.all.sample,
    price:       Faker::Commerce.price(range: 0..1000.0, as_string: true)
  )
  # Assign a random category to the product
  category = Category.all.sample

  # Create a ProductCategory record for the product
  ProductCategory.create!(
    product_id:  product.id,
    category_id: category.id
  )
end

Rails.logger.debug "#{Product.count} products created"
