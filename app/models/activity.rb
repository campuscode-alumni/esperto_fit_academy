class Activity < ApplicationRecord
  belongs_to :gym
  belongs_to :trainer

  validates :name, :price, :duration, :capacity, :difficulty, :equipments, :rules, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  enum status: { active: 0, on_hold: 1, suspended: 9 }
end
