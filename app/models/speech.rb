class Speech < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes
end
