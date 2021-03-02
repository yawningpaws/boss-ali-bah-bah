class Workday < ApplicationRecord
  belongs_to :user
  belongs_to :accident
end
