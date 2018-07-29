class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: "User"
  belongs_to :speech
  belongs_to :user

  scope :not_read, -> { where(read: false) }
  
end
