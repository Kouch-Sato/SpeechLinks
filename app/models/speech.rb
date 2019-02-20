# == Schema Information
#
# Table name: speeches
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  overview   :text(65535)
#

class Speech < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :commented_users, through: :comments, source: :user
  has_many :notification, dependent: :delete_all

  validates :title, presence: true
  validates :content, presence: true
  validates :overview, presence: true

end
