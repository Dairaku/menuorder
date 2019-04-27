class OrderController < ApplicationController
  def index
    @orderhistories = OrderHistory.all.order(created_at: "DESC")
  end

  def telled
    id = params[:orderhistid]
    @orderhistory = OrderHistory.find(id)
    if @orderhistory.update(is_telled: TRUE, is_telled_timestamp: Time.now)
    else
    end

    redirect_to action: 'index'

  end

  def cancelled
    id = params[:orderhistid]
    @orderhistory = OrderHistory.find(id)
    if @orderhistory.update(is_cancelled: TRUE, is_cancelled_timestamp: Time.now)
    else
    end

    redirect_to action: 'index'

  end


end
