class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    render 'exhibit'
  end

  def editprofile
    @user = User.find(params[:id])
    @posts = @user.posts
      render 'exhibit'
  end



  def goodsBuy
  
  end
  
  def goodsDetail

  end
  
  def register

  end

  def step1

  end

  def step2
    
  end

  def step3

  end

  def step4
    
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

  def step5
  
  end

  def editprofile
  end



  def goodsBuy
  end


  def creditInfo
  end

  def creditAdd
  end

  def creditConfirm
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
