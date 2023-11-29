class CreateProductPriceHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_price_histories do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.date :effective_date

      t.timestamps
    end
  end
end
