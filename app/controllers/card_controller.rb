class CardController < ApplicationController

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = 'sk_test_fd8c63589125feb6eb712b1a'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'] )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_fd8c63589125feb6eb712b1a'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)

      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?1215422380"
      when "MasterCard"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?2356214421"
      when "JCB"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?2356214421"
      when "American Express"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?2356214421"
      when "Diners Club"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?2356214421"
      when "Discover"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?2356214421"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = 'sk_test_fd8c63589125feb6eb712b1a'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end
end
