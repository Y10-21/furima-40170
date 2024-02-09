class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :merchandise_id, :post_number, :prefecture_id, :post_city ,:post_address, :post_building, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :merchandise_id
    validates :user_id
    validates :post_number, format: {with: /\A\d{3}-\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :post_city
    validates :post_address
    validates :telephone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  end
  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(merchandise_id: merchandise_id, user_id: user_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, post_city: post_city, post_address: post_address, post_building: post_building, telephone_number: telephone_number ,purchase_id: purchase.id)
  end
end
