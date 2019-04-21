Rails.application.routes.draw do
  get 'menus', to: 'menus#index'
  get 'menus/:menuid', to: 'menus#detail'
  post 'carts/add', to: 'carts#add'
end
