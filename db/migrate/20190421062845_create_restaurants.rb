class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :name, null: false
      t.integer :number_of_seat, null: false

      t.timestamps null: false
    end
  end
end
