class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :payslips, dependent: :destroy
  has_many :accidents, dependent: :destroy
  has_many :workdays, dependent: :destroy
  has_one_attached :ipa_photo

  has_many :notifications, as: :recipient
end
