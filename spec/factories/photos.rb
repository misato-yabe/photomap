FactoryBot.define do
  factory :photo do
    association :user
    title { 'aaa' }
    comment { 'aaaaa' }
    prefecture_id { 2 }
    situation_id { 3 }
    weather_id { 2 }
    month_id { 2 }
    camera_id { 2 }
    lens_id { 2 }
    after(:build) do |photo|
      photo.image.attach(io: File.open('spec/fixtures/test.jpg'), filename: 'test.jpg')
    end
  end
end