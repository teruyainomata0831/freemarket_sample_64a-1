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
