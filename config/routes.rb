Rails.application.routes.draw do

  root to: "posts#index"

  get 'users/mypage_side'
  get 'users/breadcrumb'
  get 'users/exhibit1'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show] do
    collection do
      get :mypage_list
      get :mypage
    end
  end

  devise_for :users, skip: :all
  devise_scope :user do
    resources :signup
  end
end