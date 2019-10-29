FactoryBot.define do
  factory :gym do
    sequence(:name) { |n| "Academia 0#{n}" }
    sequence(:cod) { |n| "00#{n}" }
    address { 'Av Paulista 111' }
    open_hour { '09:00' }
    close_hour { '22:00' }
    working_days { 'segunda à sexta' }
    gallery { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/academia_01.jpeg'), 'image/jpeg') }
  end
end
