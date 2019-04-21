class CreateOrderHistories < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.references :menu, index: true, foreign_key: true
      t.integer :quantity, null: false
      t.integer :seat_number, null: false
      t.boolean :is_telled, null: false
      t.boolean :is_cancelled, null: false
      t.timestamps :is_telled_timestamp
      t.timestamps :is_cancelled_timestamp

      t.timestamps null: false
    end
  end
end
