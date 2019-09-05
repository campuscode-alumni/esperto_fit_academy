class Gym < ApplicationRecord
  has_many :employees

  has_many :gym_trainers
  has_many :trainers , through: :gym_trainers
end
