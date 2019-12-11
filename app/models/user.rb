class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A[^@\s]+@[^@\s]+\z/

  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :nickname, :last_name, :first_name, :birth_year, :birth_month, :birth_day, presence: true
  
  has_many :items
end