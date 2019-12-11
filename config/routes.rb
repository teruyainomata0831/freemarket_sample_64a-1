Rails.application.routes.draw do
  get 'users/mypage'
  get 'users/mypage_side'
  get 'users/my'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
