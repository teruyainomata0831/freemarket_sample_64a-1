class CreditController < ApplicationController

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to new_credit_path
    else
      render 'new'
    end
  end

  private
  def credit_params
    params.require(:credit).permit(
      :card_number,
      :exp_month,
      :ep_year,
    )
  end

end