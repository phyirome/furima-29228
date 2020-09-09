FactoryBot.define do
  factory :item do
    name  { Faker::Name.initials(number: 2) }
    price { 1000 }
    text  { Faker::Lorem.sentence }
    association :user
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_id { 1 }
    shipping_from_id { 1 }
    shipping_day_id { 1 }
  end
end
