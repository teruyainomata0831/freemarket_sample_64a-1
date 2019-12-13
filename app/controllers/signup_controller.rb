class SignupController < Devise::UsersController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to signup_index_path
    else
      render '/signup/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
    )
  end

end
