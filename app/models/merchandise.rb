class Merchandise < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end

  validates :name ,length: { minimum: 1, maximum: 40 }
  validates :explanation, length: { minimum: 1, maximum: 1000 }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_load_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, inclusion: { in: 300..9999999 }
  validates :price,format:{ with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_load
  belongs_to :shipping_day

end
