class Spam < ApplicationRecord
  belongs_to :manager
  has_many :templates
  has_many :subscribers
end
