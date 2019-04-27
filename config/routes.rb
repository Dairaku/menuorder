Rails.application.routes.draw do
  get 'menus', to: 'menus#index'
  get 'menus/:menuid', to: 'menus#detail'
  get 'carts', to: 'carts#index'
  post 'carts/add', to: 'carts#add'
  post 'carts/update', to: 'carts#update'
  post 'carts/delete', to: 'carts#delete'
  post 'carts/order', to: 'carts#order'
  get 'orders', to: 'order#index'
  # TODO: コントローラー名をorder ⇨ ordersに変更
  post 'orders/telled', to: 'order#telled'
  post 'orders/cancelled', to: 'order#cancelled'
end
