class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address_line_one, :string
    add_column :users, :address_line_two, :string
    add_column :users, :admin, :boolean
  end
end
