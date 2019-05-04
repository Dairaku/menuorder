class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :menu_category, index: true, foreign_key: true
      t.text :name, null: false
      t.text :description
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
