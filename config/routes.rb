Rails.application.routes.draw do
  
  devise_for :users, skip: :all
  devise_scope :user do

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
end