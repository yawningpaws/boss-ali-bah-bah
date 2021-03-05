class Accident < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_one_attached :audio

  validates :description, presence: true
end
