class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
  before_action :basic_auth, if: :production?
  # before_action :authenticate_user! ログインしてなかった場合、サインアップページに遷移する記述
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def production?
    Rails.env.production?
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end
