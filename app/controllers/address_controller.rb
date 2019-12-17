class AddressController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    # binding.pry
    if @address.save!
      redirect_to credit_index_path
    else
      render 'new'
    end
  end

  private
  def address_params
    params.require(:address).permit(
      :postcode,
      :prefecture,
      :city,
      :block,
      :building,
    )
  end

end
