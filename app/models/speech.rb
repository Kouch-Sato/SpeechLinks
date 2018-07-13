class Speech < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :commented_users, through: :comments, source: :user

  validates :title, presence: true
  validates :content, presence: true
  validates :overview, presence: true

end
