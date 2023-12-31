class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :house, null: false, foreign_key: true, index: true
      t.string :location, null: false
      t.datetime :reservation_date, null: false

      t.timestamps
    end
  end
end
