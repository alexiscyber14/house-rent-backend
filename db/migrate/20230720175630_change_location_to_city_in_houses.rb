class ChangeLocationToCityInHouses < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :location, :city
  end
end
