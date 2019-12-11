Rails.application.routes.draw do
  
  devise_for :users, skip: :all
  devise_scope :user do
    resources :signup
  end
end