class CardController < ApplicationController

  def new
  end

  def pay
    Payjp.api_key = 'sk_test_f11178b5365a163734f1d128'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
    customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      )
    end
  end

  def show
  end
end


