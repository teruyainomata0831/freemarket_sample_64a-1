class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # facebook、google_oauth2
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          telephone: "08000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

  # 1ページ目メールアドレスでの登録時のバリデーションを記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A[^@\s]+@[^@\s]+\z/

  validates :first_name, :last_name, presence: true, format: { with: /\A[(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\p{blank}ー－]+\z/}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birth_year, :birth_month, :birth_day, presence: true, numericality: { greater_than: 0 } # 0は許可しない
  validates :nickname, presence: true
  
  has_many :items
  has_many :addresses
  has_many :credits
  has_many :cards
end