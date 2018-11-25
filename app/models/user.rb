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

  enum university: [
      :東京大学,
      :慶應義塾大学,
      :聖心女子大学,
      :津田塾大学,
      :筑波大学,
      :立教大学,
      :上智大学,
      :神奈川大学,
      :早稲田大学,
      :東京女子大学,
      :京都大学,
      :青山学院大学,
      :明治大学,
      :東京外国語大学,
      :同志社大学,
      :東北大学,
      :東京理科大学,
      :日本女子大学,
      :神戸市外語大学,
      :茨城大学,
      :獨協大学,
      :龍谷大学,
      :山口大学,
      :活水女子大学,
      :高崎経済大学,
      :ノートルダム清心女子大学,
      :昭和女子大学,
      :関西外語大学,
      :群馬県立女子大学,
      :岡山大学,
      :立命館大学,
      :法政大学,
      :北九州大学,
      :東京国際大学,
      :横浜市立大学,
      :そのほかの大学,
      :ESSのOBOG,
      :大学生以外
  ]

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
