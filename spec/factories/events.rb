FactoryBot.define do
  factory :event do
    creator { nil }
    category { "MyString" }
    price { 1 }
    start_date { "2024-06-13 10:48:19" }
    end_date { "2024-06-14 10:48:19" }
    location { "MyString" }
    description { "MyText" }
  end
end
