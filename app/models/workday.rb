class Workday < ApplicationRecord
  belongs_to :user

  validates :date, uniqueness: true

  def start_time
    check_in_time
  end
end
