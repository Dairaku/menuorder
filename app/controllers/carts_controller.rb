class CartsController < ApplicationController
  before_action :setup_cart_item, only: [:add, :index, :order, :update, :delete]

  # カートへ追加
  def add
    menuId = params[:menuId]
    quantity = params[:cart][:quantity].to_i

    # 既にメニューがカートに存在するかを判定
    @cart_item = @cart.cart_items.find_by(menu_id: menuId)

    if @cart_item.blank?
      @cart_item = @cart.cart_items.new(menu_id: menuId, quantity: quantity)
    else
      @cart_item.quantity += quantity
    end

    if @cart_item.save
    else
    end

    redirect_to action: 'index'

  end

  # カート一覧を表示
  def index
    @cart_items = @cart.cart_items
    @amount = 0
    @cart_items.each do |item|
      @amount += item.menu.price * item.quantity
    end
  end

  # カート一覧を注文
  def order
    seat_number = params[:seat][:number]

    # TODO：エラーチェック

    # @cart_itemsをOrderテーブルに挿入
    @cart_items = @cart.cart_items
    @cart_items.each do |item|
      @order_history = OrderHistory.new(menu_id: item.menu_id, quantity: item.quantity, seat_number: seat_number)
      @order_history.save
    end

    # 注文完了後、session[:cart_id]を削除する
    session[:cart_id] = nil

    # TODO：リダイレクト先を変更する
    # TODO：リダイレクト先にnoticeを渡す
    redirect_to action: 'index'

  end

  # 数量を変更
  def update
    menuId = params[:menuId]
    quantity = params[:cart_list][:quantity].to_i

    @cart_item = @cart.cart_items.find_by(menu_id: menuId)

    if @cart_item.update(quantity: quantity)
      # TODO：成功メッセージ
    else

    end

    redirect_to action: 'index'

  end

  # 商品を削除
  def delete
    menuId = params[:menuId]
    @cart_item = @cart.cart_items.find_by(menu_id: menuId)

    if @cart_item.delete
      # TODO：成功メッセージ
    else

    end

    redirect_to action: 'index'
  end

  private
  def setup_cart_item

    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

  end

end
