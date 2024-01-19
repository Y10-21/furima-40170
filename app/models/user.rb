class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :name_first
    validates :name_secound
    validates :name_first_kana
    validates :name_secound_kana
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d ])[a-z\d]+\z/i }, on: :create
  validates :name_first, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_secound, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_first_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :name_secound_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
end
