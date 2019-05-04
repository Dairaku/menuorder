# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# テスト用
# Restaurant.create!(
#   name: 'Bistro Wai Wai',
#   number_of_seat: 10
# )
#
# MenuCategory.create!(
#   name: 'サラダ',
#   kbn: 1
# )
#
# MenuCategory.create!(
#   name: '冷菜',
#   kbn: 1
# )
# MenuCategory.create!(
#   name: 'ハイボール',
#   kbn: 2
# )
#
# MenuCategory.create!(
#   name: '芋焼酎',
#   kbn: 2
# )
#
# MenuCategory.create!(
#   name: '日本酒',
#   kbn: 2
# )
#
# Menu.create!(
#   restaurant_id: 1,
#   menu_category_id: 1,
#   name: '豆腐の和風サラダとりとグレープフルーツのゴマサラダ',
#   description: 'テストテストテストテストテストテストテストテスト',
#   price: 690
# )
#
# Menu.create!(
#   restaurant_id: 1,
#   menu_category_id: 2,
#   name: 'チーズ盛り合わせ',
#   description: 'テストテストテストテストテストテストテストテスト',
#   price: 1000
# )
#
# Menu.create!(
#   restaurant_id: 1,
#   menu_category_id: 3,
#   name: 'ハイボール',
#   description: 'テストテストテストテストテストテストテストテスト',
#   price: 500
# )
#
# Menu.create!(
#   restaurant_id: 1,
#   menu_category_id: 4,
#   name: '麦焼酎',
#   description: 'テストテストテストテストテストテストテストテスト',
#   price: 500
# )
#
# Menu.create!(
#   restaurant_id: 1,
#   menu_category_id: 5,
#   name: '日本酒',
#   description: 'テストテストテストテストテストテストテストテスト',
#   price: 500
# )

require "csv"

CSV.foreach('db/initialdata/menu_categories.csv', headers: true) do |row|
  MenuCategory.create(kbn: row[1], name: row[2])
end

CSV.foreach('db/initialdata/menus.csv', headers: true) do |row|
  Menu.create(restaurant_id: row[1], menu_category_id: row[2], name: row[3], description: row[4], price:row[5])
end
