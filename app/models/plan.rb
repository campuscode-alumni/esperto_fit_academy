class Plan < ApplicationRecord
  validates :name, :minimum_permanence, presence: { message: 'Todos os campos devem ser preenchidos' }
  validates :name, uniqueness: { message: 'O nome deve ser único'}
end
