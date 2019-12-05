Rails.application.routes.draw do
  root to: 'posts#index'
  
  devise_for :users
  resources :users, only: [:edit, :update]

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
  end
end
