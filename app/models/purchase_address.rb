class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :merchandise_id, :post_number, :prefecture_id, :post_city ,:post_address, :post_building, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :merchandise_id
    validates :user_id
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :post_city
    validates :post_address
    validates :telephone_number, numericality: { only_integer: true }, length: { is: 10 }
  end
  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(merchandise_id: merchandise_id, user_id: user_id)
    Adress.create(post_number: post_number, prefecture_id: prefecture_id, post_city: post_city, post_address: post_address, telephone_number: telephone_number ,purchase_id: purchase_id)
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
