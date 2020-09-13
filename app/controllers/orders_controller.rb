class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order = OrderItems.new
  end
  
  def create
    @item = Item.find(params[:item_id])
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

  
  def pay_item
    Payjp.api_key = "sk_test_a5526e9643916d5860050c49"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
