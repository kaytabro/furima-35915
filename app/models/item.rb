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





  #Active Hashのバリデーション
  validates :category_id, :status_id, :postage_id, :prefecture_id, :take_days_id, numericality: { other_than: 1 , message: "can't be blank"}

end
