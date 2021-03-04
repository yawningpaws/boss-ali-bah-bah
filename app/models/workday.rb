class Workday < ApplicationRecord
  belongs_to :user

  validates :date, uniqueness: true
end
