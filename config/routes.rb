Rails.application.routes.draw do

  root 'posts#index'
  
  devise_for :users, skip: :all
  devise_scope :user do
    resources :signup
  end
end