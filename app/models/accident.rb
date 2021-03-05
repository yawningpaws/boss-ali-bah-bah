class Accident < ApplicationRecord
  belongs_to :user
  has_many :workdays
  has_many_attached :photos
  has_one_attached :audio
end
