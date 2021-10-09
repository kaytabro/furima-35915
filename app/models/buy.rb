class Buy < ApplicationRecord

 # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one    :add

end
