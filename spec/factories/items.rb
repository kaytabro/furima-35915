FactoryBot.define do
  factory :item do
    name          { Faker::Name.name}
    explain       { Faker::Lorem.sentence}
    category_id   { Faker::Number.between(from: 2, to: 11) }
    status_id     { Faker::Number.between(from: 2, to:  7) }
    postage_id    { Faker::Number.between(from: 2, to:  3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    take_days_id  { Faker::Number.between(from: 2, to:  4) }
    price         { Faker::Number.between(from: 300, to: 9999999) }

    #ダミーデータの生成に合わせてユーザ‐を生成する
    association :user

    #生成するダミーデータに画像'public/images/test_image.png'を添付
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
