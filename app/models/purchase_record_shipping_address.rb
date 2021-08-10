class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :area_id, :city, :street, :phone, :purchase_record_id, :building, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :city
    validates :street
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :token

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :area_id
    end
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, street: street, building: building,
                           phone: phone, purchase_record_id: purchase_record.id)
  end
end
