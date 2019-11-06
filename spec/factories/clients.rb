FactoryBot.define do
  factory :client do
    name { "Vinícius" }
    sequence(:cpf) { |n| "385.093.321-0#{n}"}
    email { "vini@gmail.com" }
    status { 0 }
    gym 
    plan 
  end
end
