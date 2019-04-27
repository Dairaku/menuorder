Rails.application.routes.draw do
  get 'menus', to: 'menus#index'
  get 'menus/:menuid', to: 'menus#detail'
  post 'carts/add', to: 'carts#add'
  post 'carts/order', to: 'carts#order'
  get 'carts/list', to: 'carts#list'
end
