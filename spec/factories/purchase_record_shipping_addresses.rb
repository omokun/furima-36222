FactoryBot.define do
  factory :purchase_record_shipping_address do
    postal_code { '165-0035' }
    area_id     { 2 }
    city        { '中野区' }
    street      { '白鷺1-1-1' }
    building    { 'フォンティスビル' }
    phone       { '09011111111' }
    token       { 'tok_abcdefghijk00000000000000000' }
  end
end
