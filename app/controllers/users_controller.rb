class UsersController < ApplicationController

  def mypage
  end

  def mypage_list
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
