class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.text :name, null: false
      t.text :description, null: false
      t.text :image_path_01
      t.text :image_path_02
      t.text :image_path_03
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
