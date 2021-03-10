class AttachPhotoJob < ApplicationJob
  queue_as :default

  def perform(instance)
    instance.save
  end
end
