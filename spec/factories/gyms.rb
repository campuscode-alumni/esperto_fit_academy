FactoryBot.define do
  factory :gym do
    sequence(:name) { |n| "Academia #{n}"}
    sequence(:cod) { |n| "00#{n}"}
    address {"Av Paulista 111"}
    open_hour {"09:00"}
    close_hour {"22:00"}
    working_days {"segunda à sexta"}
  end
end
