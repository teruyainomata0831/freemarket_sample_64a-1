class CardController < ApplicationController
  def index
  end

  def new
  end

  def pay
    Payjp.api_key = 'sk_test_f11178b5365a163734f1d128'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        card: params['payjp-token']
      )
      # @card = Card.new( customer_id: customer.id, card_id: customer.default_card)
      # if @card.save
      #   redirect_to action: "show"
      # else
      #   redirect_to action: "pay"
      # end
    end
  end

  def show
  end
end