class MenusController < ApplicationController
  def index
    # 座席番号をセッションに保存
    if params[:seat_number].present?
      session[:seat_number] = params[:seat_number]
    end

    @menus = Menu.where(menu_category_id:params[:menu_category_id])

    # view表示用変数
    if params[:menu_category_id].present?
      @menu_category = MenuCategory.find_by_id(params[:menu_category_id])
    end

    @food_menu_categories = MenuCategory.where(kbn: 1)
    @drink_menu_categories = MenuCategory.where(kbn: 2)
  end

  def detail
    @menu = Menu.find(params[:menuid])
    @menuId = params[:menuid]
  end
end
