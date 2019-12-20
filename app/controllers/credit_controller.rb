class CreditController < ApplicationController

  def index
  end

  def step4
    card = Card.where(user_id: current_user.id)
    redirect_to action: "step5" if card.exists?
  end

  def step5
    
  end

  def pay
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "step4"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'] )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "step5"
      else
        redirect_to action: "pay"
      end
    end
  end
end