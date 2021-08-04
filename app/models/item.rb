class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :name
    validates :item_description

    # with_options format: { with: /\A[0-9]+\z/, message: 'Only single-byte numbers can be used.' } do
      validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    # end

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :shipping_cost_id
      validates :area_id
      validates :shipping_time_id
    end
  end

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_time
  has_one_attached :image
  # has_one :purchase_record
end
