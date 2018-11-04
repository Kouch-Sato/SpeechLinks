class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :speeches, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :liked_speeches, through: :likes, source: :speech
  has_many :commented_speeches, through: :comments, source: :speech
  has_many :notification, dependent: :delete_all

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :bio, presence: true
  validates :university, presence: true
  validates :grade, presence: true

  enum university: [:東京大学, :慶應義塾大学, :聖心女子大学, :津田塾大学, :筑波大学, :立教大学, :上智大学]

  def links_point
    links_point = 0
    self.speeches.each do |speech|
      links_point += 3
      links_point += speech.likes.count
      links_point += speech.comments.count
    end
    links_point += self.likes.count
    links_point += self.commented_speeches.count
    return links_point
  end
end
