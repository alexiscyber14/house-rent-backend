class ChangeColumnNamesInHouses < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :area, :location
  end
end
