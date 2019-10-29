FactoryBot.define do
  factory :trainer do
    email {"treinadora_amanda@espertofit.com"}
    name {'Thiago'}
    cpf { 123 }
    status {:available}
  end
end
