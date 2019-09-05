class Trainer < ApplicationRecord
  has_many :activities
  
  enum status: {available: 0, unavailable: 10 }

  validates :name, :cpf , presence:true
  validates :cpf, uniqueness:true

  def translate_status
    I18n.t "activerecord.attributes.trainer.status.#{status}"

  end 
end
