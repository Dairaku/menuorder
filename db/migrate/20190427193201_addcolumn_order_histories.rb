class AddcolumnOrderHistories < ActiveRecord::Migration
  def change
    add_column :order_histories, :is_telled_timestamp, :datetime
    add_column :order_histories, :is_cancelled_timestamp, :datetime
  end
end
