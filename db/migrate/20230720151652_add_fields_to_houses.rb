class AddFieldsToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :date_built, :date
    add_column :houses, :category, :string
    add_column :houses, :description, :text
    add_column :houses, :image_url, :string
  end
end
