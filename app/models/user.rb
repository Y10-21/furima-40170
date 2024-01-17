class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password
    validates :name_first
    validates :name_secound
    validates :name_first_kana
    validates :name_secound_kana
    validates :birthday
  end
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :name_first, format: { with: /\A[^\p{ASCII}]+\z/}
  validates :name_secound, format: { with: /\A[^\p{ASCII}]+\z/}
  validates :name_first_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :name_secound_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
end
