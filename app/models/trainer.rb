class Trainer < ApplicationRecord
  validates :name, :cpf , presence:true
end
