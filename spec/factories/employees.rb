FactoryBot.define do
  factory :employee do
    name {'Alan'}
    status {'active'}
    email {'batata@espertofit.com.br'}
    password {'123456'}
    gym

    trait :admin do
      admin { true }
    end

    trait :trainer do
      admin { false }
    end
  end
end
