class ChangeLocationDataTypeInHouses < ActiveRecord::Migration[7.0]
  def change
    change_column :houses, :location, :text
  end
end
