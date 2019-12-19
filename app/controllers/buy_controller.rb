class BuyController < ApplicationController
  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = 'sk_test_fd8c63589125feb6eb712b1a'
      Payjp::Customer.retrieve(card.customer_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = 'sk_test_fd8c63589125feb6eb712b1a'
    Payjp::Charge.create(
    :amount => 6000, 
    :customer => card.customer_id, 
    :currency => 'jpy',
  )
  redirect_to action: 'fin'
  end

  def fin
  end
end
