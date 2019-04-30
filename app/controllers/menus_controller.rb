class MenusController < ApplicationController
  def index
    # TODO: category_idの入力値・存在チェック
    # 座席番号をセッションに保存
    if session[:seat_number].blank?
      session[:seat_number] = params[:seat_number]
    end

    @menus = Menu.where(menu_category_id:params[:menu_category_id])
    @food_menu_categories = MenuCategory.where(kbn: 1)
    @drink_menu_categories = MenuCategory.where(kbn: 2)
  end

  def detail
    @menu = Menu.find(params[:menuid])
    @menuId = params[:menuid]
  end
end
