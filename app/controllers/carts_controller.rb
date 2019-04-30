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
      redirect_to "/menus/#{menuId}", success: "カートに追加しました。"
    else
      render "detail"
    end
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
    seat_number = session[:seat_number]

    if seat_number.blank?
      redirect_to "/carts", danger: "再度QRコードの読み取りをお願いします。"
      exit
    end

    # @cart_itemsをOrderテーブルに挿入
    @cart_items = @cart.cart_items
    @cart_items.each do |item|
      # トランザクション開始
      OrderHistory.transaction do
        @order_history = OrderHistory.new(menu_id: item.menu_id, quantity: item.quantity, seat_number: seat_number)
        @order_history.save!
      end   # transactionブロックを正常に抜けるとコミットされる
    end

    session[:cart_id] = nil

    redirect_to '/carts', success: "注文が完了しました。"
  end

  # 数量を変更
  def update
    menuId = params[:menuId]
    quantity = params[:cart_list][:quantity].to_i

    @cart_item = @cart.cart_items.find_by(menu_id: menuId)

    if @cart_item.update(quantity: quantity)
      redirect_to '/carts', success: "#{@cart_item.menu.name}の数量を変更しました。"
    else
      flash.now[:error] = '#{@cart_item.menu.name}の数量の変更に失敗しました。お手数ですが、スタッフをお呼びくださいませ。'
      render "index"
    end
  end

  # 商品を削除
  def delete
    menuId = params[:menuId]
    @cart_item = @cart.cart_items.find_by(menu_id: menuId)

    if @cart_item.delete
      redirect_to '/carts', success: "#{@cart_item.menu.name}をカートから削除しました。"
    else
      flash.now[:error] = '#{@cart_item.menu.name}をカートから削除できませんでした。お手数ですが、スタッフをお呼びくださいませ。'
      render "index"
    end
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
