class AttachPhotoJob < ApplicationJob
  queue_as :default

  def perform(params)
    Payslip.create(params)
  end
end
