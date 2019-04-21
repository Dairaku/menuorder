class CartsController < ApplicationController
  # カートへの追加メソッド
  def add
    session[:cart] = {param[:menu_id], param[:quantity]}
  end
end
