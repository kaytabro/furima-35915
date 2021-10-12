class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX     = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX     = /\A[ァ-ヶ一]+\z/.freeze

  validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }

  with_options presence: true do
    validates :nickname, :birthday
    validates :first_name, :last_name, format: { with: NAME_REGEX, message: 'には全角文字を使用してください' }
    validates :first_name_kana, :last_name_kana, format: { with: KANA_REGEX, message: 'には全角カナを使用してください' }
  end

  # アソシエーション
  has_many :items
  has_many :buys

end
