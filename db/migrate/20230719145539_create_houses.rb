class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.integer :area
      t.integer :rental_fee, null:false

      t.timestamps
    end
  end
end
