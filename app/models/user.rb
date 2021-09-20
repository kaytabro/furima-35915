class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX     = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX     = /\A[ァ-ヶ一]+\z/.freeze

  validates :password, format: { with: PASSWORD_REGEX , message: 'には英字と数字の両方を含めて設定してください'}
  validates :nickname, :birthday, presence: true
  validates :first_name, :last_name, presence: true, format: { with: NAME_REGEX , message: '全角文字を使用してください'}
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: KANA_REGEX , message: '全角カナを使用してください'}

end
