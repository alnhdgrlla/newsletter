class Manager < ApplicationRecord
  has_many :spams, dependent: :destroy
  has_many :templates, through: :spams
  has_many :subscribers, through: :spams

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
