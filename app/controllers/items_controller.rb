class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :current_user_discrimination, only: [:edit, :update, :destroy]
  before_action :judge_item, only: [:edit, :update, :destroy]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :detail, :category_id, :status_id, :delivery_price_id, :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def current_user_discrimination
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  #購入履歴判断処理
  def judge_item
    if @item.order.nil? != true
      redirect_to root_path
    end
  end

end
