Rails.application.routes.draw do
  
  devise_for :users, skip: :all
  devise_scope :user do
    resources :signup do
      collection do
        post 'done'
      end
    end
  end
end