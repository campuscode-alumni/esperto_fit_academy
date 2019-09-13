class Trainer < ApplicationRecord
  has_many :gym_trainers
  has_many :gyms , through: :gym_trainers

  has_many :activities

  enum status: {available: 0, unavailable: 10 }

  validates :name, :cpf , presence:true
  validates :cpf, uniqueness:true

  def translate_status
    I18n.t "activerecord.attributes.trainer.status.#{status}"
  end

  def gym?(gym)
    gyms.include?(gym)

  end

  def gym_trainer(gym)
    gym_trainers.find_by(gym: gym)
  end

end
