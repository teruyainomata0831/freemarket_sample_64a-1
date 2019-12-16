class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A[^@\s]+@[^@\s]+\z/

  validates :first_name, :last_name, presence: true, format: { with: /\A[(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\p{blank}ー－]+\z/}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birth_year, :birth_month, :birth_day, presence: true, numericality: { greater_than: 0 }
  validates :nickname, presence: true

  has_many :items
end