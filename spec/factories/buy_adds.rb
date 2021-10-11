FactoryBot.define do
  factory :buy_add do
    post_number    { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { '東京都' }
    address        { '1-1' }
    building       { '東京ハイツ' }
    phone_number   { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end