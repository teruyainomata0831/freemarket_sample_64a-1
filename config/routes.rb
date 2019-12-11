Rails.application.routes.draw do
  get 'users/mypage_side'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users, only:[:show] do
    collection do
      get :mypage_list
      get :mypage
    end
  end
end