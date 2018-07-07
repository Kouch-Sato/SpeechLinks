class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :speeches, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :name, presence: true
  validates :bio, presence: true
  validates :university, presence: true
  validates :grade, presence: true

  enum university: [:東京大学, :慶應義塾大学, :聖心女子大学]
end
