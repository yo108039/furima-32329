class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :get_item_params, only: [:index, :create]

  def index
    #ログインユーザー判断処理
    if current_user.id == @item.user_id  || @item.order.nil? != true
      redirect_to root_path
    end

    @order_info = OrderInfo.new
  end
  
  def create
    @order_info = OrderInfo.new(order_params)
    if @order_info.valid?
      pay_item
      @order_info.save
      redirect_to :root
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_info).permit(:credit_info, :credit_month, :credit_year, :credit_cvc,:delivery_mail_num, :delivery_area_id, :delivery_shikutyouson, :delivery_numbering, :delivery_building_name, :delivery_telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def get_item_params
   @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end

