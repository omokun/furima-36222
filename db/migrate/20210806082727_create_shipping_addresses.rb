class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code,     null: false
      t.integer    :area_id,         null: false
      t.string     :city,            null: false
      t.string     :street,          null: false
      t.string     :building
      t.string     :phone,           null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
