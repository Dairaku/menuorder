class AddcolumnOrderHistories < ActiveRecord::Migration
  def change
    add_column :order_histories, :is_telled_timestamp, :timestamps
    add_column :order_histories, :is_cancelled_timestamp, :timestamps
  end
end
