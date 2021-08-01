class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :last_name,          presence: true,
                                 format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use double-byte characters (kanji, hiragana, and katakana)' }
  validates :first_name,         presence: true,
                                 format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Please use double-byte characters (kanji, hiragana, and katakana)' }
  validates :last_name_kana,     presence: true,
                                 format: { with: /\A[ァ-ヶ]+\z/, message: 'Please use double-byte characters (katakana)' }
  validates :first_name_kana,    presence: true,
                                 format: { with: /\A[ァ-ヶ]+\z/, message: 'Please use double-byte characters (katakana)' }
  validates :birthday,           presence: true
  validates :password,           presence: true,
                                 format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Please include both single-byte alphanumeric characters.' }

  has_many :items, dependent: :destroy
  has_many :purchase_records, dependent: :destroy
end
