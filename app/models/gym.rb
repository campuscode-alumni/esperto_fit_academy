class Gym < ApplicationRecord
  has_many :employees

  has_many :gym_trainers
  has_many :trainers , through: :gym_trainers
  has_many_attached :gallery
  has_many :activities
  has_many :prices
  has_many :plans, through: :prices

  validates :name, :cod, :address, :open_hour, :close_hour, :working_days, :gallery,  presence: true
  validates :name, :cod, uniqueness: true

end
