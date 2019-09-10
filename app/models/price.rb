class Price < ApplicationRecord
  belongs_to :gym
  belongs_to :plan

  validates :value, :gym_id, :plan_id, presence: {message: 'Você deve preencher todos os campos'}

  def price_format
    "R$#{value / 100.0}"
  end
end