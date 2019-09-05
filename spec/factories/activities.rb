FactoryBot.define do
  factory :activity do
    name { "MyString" }
    status { 1 }
    price { 1.5 }
    duration { 1 }
    capacity { 1 }
    difficulty { "MyString" }
    equipments { "MyString" }
    rules { "MyText" }
    gym { nil }
    trainer { nil }
  end
end
