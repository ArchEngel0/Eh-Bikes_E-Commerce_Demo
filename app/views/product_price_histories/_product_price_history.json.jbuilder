json.extract! product_price_history, :id, :product_id, :price, :effective_date, :created_at, :updated_at
json.url product_price_history_url(product_price_history, format: :json)
