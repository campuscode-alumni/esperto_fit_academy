FactoryBot.define do
  factory :activity do
    name { "Zumba" }
    status { 0 }
    price { 45.35 }
    duration { 35 }
    capacity { 56 }
    difficulty { "Fácil" }
    equipments { "Nenhum" }
    rules { "Respeitar todos os membros presentes" }
    gym 
    trainer 
  end
end
