class Spam < ApplicationRecord
  belongs_to :manager
  has_many :templates, dependent: :destroy
  has_many :subscribers, dependent: :destroy
end
