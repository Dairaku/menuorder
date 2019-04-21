class CartsController < ApplicationController
  # カートへの追加メソッド
  def add
    # セッションに既にmenuIdがあれば、数量を追加する。なければmenuId・数量を新規で追加する。
    menuId = params[:menuId]
    quantity = params[:cart][:quantity]

    if session[:cart].nil?
      session[:cart] = {"#{menuId}": quantity}
    elsif session[:cart].has_key?("#{menuId}")
      logger.debug(session[:cart]["#{menuId}"].to_i)
      session[:cart]["#{menuId}"] =  session[:cart]["#{menuId}"].to_i + quantity.to_i
    else
      logger.debug(session[:cart]["#{menuId}"])
      session[:cart]["#{menuId}"] = quantity.to_i
    end

  end
end
