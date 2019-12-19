class ItemsController < ApplicationController

  before_action :set_user, :set_image, only: [:buy, :show, :exhibit]
  



    def index
      @items = Item.all.includes(:images)
    end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(create_params)

      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path
    end
  end

  def buy
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def exhibit
    @item = Item.find(params[:id])
    @items = Item.all.includes(:images)
  end 

  def edit
  end
  private
  def create_params
    params.require(:item).permit(:name, :description, :region, :size, :status, :shipping_fee, :shipping_date, :price, :shipping_method,  :profit, images_attributes: [:image, :id, :_destroy]).merge(seller_id: current_user.id)
   
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_image
    @images = Image.find(params[:id])
    @images = @images.image
  end
  
end
