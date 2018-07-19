class Like < ApplicationRecord
  belongs_to :user
  belongs_to :speech

  validates_uniqueness_of :speech_id, scope: :user_id
end
