class Manager < ApplicationRecord
  has_many :spams, dependent: :destroy
  has_many :templates, through: :spam
  has_many :subscribers, through: :spam

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
