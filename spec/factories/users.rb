FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '大森' }
    first_name            { '博史' }
    last_name_kana        { 'オオモリ' }
    first_name_kana       { 'ヒロシ' }
    birthday              { '19831215' }
  end
end
