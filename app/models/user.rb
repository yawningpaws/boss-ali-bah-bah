class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_update_commit {broadcast_replace_to "tweets"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notifications, dependent: :destroy
  has_many :payslips, dependent: :destroy
  has_many :accidents, dependent: :destroy
  has_many :workdays, dependent: :destroy
  has_one_attached :ipa_photo
  has_many_attached :contract_photos
end
