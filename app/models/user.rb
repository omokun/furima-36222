class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                           message: 'Please use double-byte characters (kanji, hiragana, and katakana)' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'Please use double-byte characters (katakana)' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                           message: 'Please include both single-byte alphanumeric characters.' } do
      validates :password
    end
  end

  # has_many :items, dependent: :destroy
  # has_many :purchase_records, dependent: :destroy
end
