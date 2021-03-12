class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, authentication_keys: [:phone_number]
  has_many :payslips, dependent: :destroy
  has_many :accidents, dependent: :destroy
  has_many :workdays, dependent: :destroy
  has_one_attached :ipa_photo

  has_many :notifications, as: :recipient

  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A[689]\d{7}\z/ }
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, minimum: 6, too_short: 'Your password should be at least 6 characters long'


  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
