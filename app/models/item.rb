class Item < ApplicationRecord

  #devise(User)とのアソシエーション
  belongs_to :user

  #Active Storageとのアソシエーション
  has_one_attached :image
  
  #Active Hashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :take_days

  #バリデーション
  validates :image, :name, :explain, :price, presence: true
  validates :price, numericality: { only_integer: true, message: "価格は、価格は半角数値で設定して下さい" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 ,　message: "価格は、¥300~¥9,999,999の間で設定して下さい" }

  #Active Hashのバリデーション
  validates :category_id, :status_id, :postage_id, :prefecture_id, :take_days_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

end
