class GymTrainer < ApplicationRecord

  
  belongs_to :trainer
  belongs_to :gym

  validates :gym, uniqueness: {scope: :trainer}
end
