Rails.application.routes.draw do

  root 'posts#index'

  resources :posts

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup do
      collection do
        get 'page1'
        get 'page2'
        get 'page3' # ここで全て入力完了。このページの送信ボタンを押した後にcreateが走る
        get 'done' # 登録完了後のページ
      end
    end
  end

end
