class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } 
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } 
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角（カタカナ）を使用してください' } 
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角（カタカナ）を使用してください' } 
  validates :birthday,           presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字の両方を含めて設定してください' } 

  has_many :items, dependent: :destroy
  has_many :purchase_records, dependent: :destroy
end