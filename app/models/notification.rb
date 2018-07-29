class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: "User"
  belongs_to :speech
  belongs_to :user



  Notification.create(user_id: 1, speech_id: 1, notified_by_id: 2)
  
end
