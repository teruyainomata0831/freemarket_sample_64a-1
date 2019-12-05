class SignupController < ApplicationController

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      postcode: session[:postcode],
      prefeture: session[:prefeture],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      phone_number: session[:phone_number],
      credit: session[:credit],
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end
  
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def step4
    # step3で入力された値をsessionに保存
    session[:postcode] = user_params[:postcode]
    session[:prefeture] = user_params[:prefeture]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    @user = User.new # 新規インスタンス作成
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
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
      :postcode,
      :prefeture,
      :city,
      :block,
      :building,
      :phone_number,
      :credit,
  )
  end
end
