class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index,:create]
  before_action :move_index, only: [:create]
  def index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    @order = OrderItems.new
  end
  
  def create
    @order = OrderItems.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:post, :prefecture_id, :city, :address, :building, :phone_number, :token, :order_id,:item_id).merge(user_id: current_user.id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_index
    @order = @item.order
      if @order
        redirect_to root_path
      end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
