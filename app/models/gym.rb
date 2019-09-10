class Gym < ApplicationRecord
  validates :name, :cod, :address, :open_hour, :close_hour, :working_days, :gallery, presence: true
  validates :name, :cod, uniqueness: true
  has_many_attached :gallery

  has_many :prices
  has_many :plans, through: :prices
end
