class ChangeCityToLocationInHouses < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :city, :location
  end
end
