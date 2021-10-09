class BuyAdd

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :municipalities, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Not include hyphen(-)"}
    validates :item_id, :user_id
  end

  def save
    # 購入者情報を保存し、変数buyに代入する
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所を保存する,buy_idには、変数buyのidと指定する
    Add.create(post_number: post_number, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
  end

end