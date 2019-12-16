class UsersController < ApplicationController


  def mypage
  end

  def mypage_list
  end

  def editprofile
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
