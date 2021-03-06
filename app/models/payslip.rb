class Payslip < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :month, presence: true, inclusion: { in: (1..12) }
  validates :year, presence: true
  validates :amount, presence: true
  validates :payment_method, inclusion: { in: ["bank transfer", "cash", "bank transfer and cash"] }
end
