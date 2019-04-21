class MenusController < ApplicationController
  def index
    # TODO: category_idの入力値・存在チェック
    # TODO: 0件取得の際のエラー表示
    @menus = Menu.where(category_id:params[:category_id])
  end

  def detail
    @menu = Menu.find(params[:menuid])
    @menuId = params[:menuid]

  end
end
