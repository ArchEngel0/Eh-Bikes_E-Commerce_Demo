json.extract! product, :id, :name, :description, :image, :sale, :created_at, :updated_at
json.url product_url(product, format: :json)
