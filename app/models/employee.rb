class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: { unactive: 0, active: 1 }
  validates :name, :status, :gym, :email,  presence: { message: 'deve ser preenchido!' }
  validates :email, uniqueness: { message: 'Email deve ser unico!' }
end
