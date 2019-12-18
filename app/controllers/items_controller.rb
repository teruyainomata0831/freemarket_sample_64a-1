class ItemsController < ApplicationController

  def index
    @items = Item.all

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(create_params)
      if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end


  private
  def create_params
    params.require(:item).permit(:name, :description, :prefecture_id, :size, :status, :shipping_fee, :prefecture_id, :shipping_date, :price, :shipping_method, images_attributes: [:image, :id, :_destroy])
  end
end