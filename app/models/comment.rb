class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :speech

  validates :content, presence: true
end
