class RenameLocationToCityInReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :location, :city
  end
end
