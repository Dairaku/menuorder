class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.text :name, null: false
      t.integer :kbn, null: false
      t.timestamps null: false
    end
  end
end
