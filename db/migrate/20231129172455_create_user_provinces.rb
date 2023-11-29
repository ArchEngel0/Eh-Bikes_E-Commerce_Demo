class CreateUserProvinces < ActiveRecord::Migration[7.1]
  def change
    create_table :user_provinces do |t|
      t.references :user, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
