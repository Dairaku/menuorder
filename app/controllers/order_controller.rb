class OrderController < ApplicationController
  def index
    @orderhistories = OrderHistory.all.order(created_at: "DESC")
  end

  def telled
    id = params[:orderhistid]
    @orderhistory = OrderHistory.find(id)

    if @orderhistory.update(is_telled: TRUE, is_telled_timestamp: Time.now)
      redirect_to '/orders', success: "注文ステータスを「厨房伝達済み」に変更しました。"
    else
      flash.now[:error] = '注文ステータスの変更に失敗しました。お手数ですが、システム管理者へお問い合わせくださいませ。'
      render "index"
    end

  end

  def cancelled
    id = params[:orderhistid]
    @orderhistory = OrderHistory.find(id)
    if @orderhistory.update(is_cancelled: TRUE, is_cancelled_timestamp: Time.now)
      redirect_to '/orders', success: "注文ステータスを「キャンセル済み」に変更しました。"
    else
      flash.now[:error] = '注文ステータスの変更に失敗しました。お手数ですが、システム管理者へお問い合わせくださいませ。'
      render "index"
    end
  end


end
