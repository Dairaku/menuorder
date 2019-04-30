# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create!(
  name: 'Bistro Wai Wai',
  number_of_seat: 10
)

MenuCategory.create!(
  [
    {
      name: 'サラダ',
      kbn: 1
    },
    {
      name: '冷菜',
      kbn: 1
    }
  ]
)

Menu.create!(
  [
    {
      restaurant_id: 1,
      menu_category_id: 1,
      name: '豆腐の和風サラダとりとグレープフルーツのゴマサラダ',
      description: 'テストテストテストテストテストテストテストテスト',
      price: 690
    },
    {
      restaurant_id: 1,
      menu_category_id: 2,
      name: 'チーズ盛り合わせ',
      description: 'テストテストテストテストテストテストテストテスト',
      price: 1000
    }
  ]
)
