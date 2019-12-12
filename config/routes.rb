Rails.application.routes.draw do
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  # root "images#index"
  resources :items
  resources :images, only: [:index, :create]
end
