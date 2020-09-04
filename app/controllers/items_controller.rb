class ItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
  end

  def new
    if user_signed_in?
    @items = Item.new
    @item.images.new
    end
  end
end

