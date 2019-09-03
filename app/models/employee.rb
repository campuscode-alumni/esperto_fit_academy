class Employee < ApplicationRecord
  enum status: { unactive: 0, active: 1 }
  validates :name, :status, :gym, :email,  presence: true
end
