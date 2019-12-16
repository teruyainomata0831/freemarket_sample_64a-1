class AddressController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to new_credit_path
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
