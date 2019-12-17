Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  resources :items

  resources :posts do
    collection do
      get 'editprofile'
      get 'goodsBuy'
      get 'goodsDetail'
      get 'mypageSidebar'
      get 'register'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
    end
  end
 
end
