class Buy < ApplicationRecord
  attr_accessor :token, :price

 # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one    :add

end
