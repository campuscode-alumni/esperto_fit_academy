class Gym < ApplicationRecord
  validates :name, :cod, :address, :open_hour, :close_hour, :working_days, presence: true
  validates :name, :cod, uniqueness: true
  has_many_attached :gallery
end
