FactoryBot.define do
  factory :user do
    nickname { 'Face' }
    email { 'asd@asdfg' }
    password { '00000a' }
    password_confirmation { '00000a' }
    last_name { '鈴木' }
    first_name { '良雄' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'ヨシオ' }
  end
end
