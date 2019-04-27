class AddOrderhistoriesToIsTelled < ActiveRecord::Migration
  def change
    change_column_default(:order_histories, :is_telled, false)
    change_column_default(:order_histories, :is_cancelled, false)
  end
end
