FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '陸太郎' }
    kana_family_name { 'ヤマダ' }
    kana_first_name { 'リクタロウ' }
    birthday { Faker::Date.birthday }
  end
end
