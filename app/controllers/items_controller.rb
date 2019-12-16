class ItemsController < ApplicationController



  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(create_params)
    binding.pry
      if @item.save
        # params[:images][:image].each do |image|
        # @item.images.create(image: image,item_id:@item.id)
        redirect_to root_path
      else
        render "items/new"
      # end
    end
  end




  private
  def create_params
    params.require(:item).permit(:name, :description, :prefecture, :size, :status, :shipping_fee, :prefecture_id, :shipping_date, :price, :shipping_method,  :profit, images_attributes: [:image, :id, :_destroy]).merge(seller_id: current_user.id)
  end
end