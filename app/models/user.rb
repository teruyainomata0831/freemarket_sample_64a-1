class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # facebook、google_oauth2
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # 1ページ目メールアドレスでの登録時のバリデーションを記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A[^@\s]+@[^@\s]+\z/

  validates :first_name, :last_name, presence: true, format: { with: /\A[(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\p{blank}ー－]+\z/}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birth_year, :birth_month, :birth_day, presence: true, numericality: { greater_than: 0 }
  validates :nickname, presence: true
  
  has_many :items
end