class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: "User"
  belongs_to :speech
  belongs_to :user

  scope :not_read, -> { where(read: false) }

  def how_long_ago
    if (Time.now - self.created_at) < 60 * 60
      # 1時間以内なら
      ((Time.now - self.created_at) / 60).to_i.to_s + "分前"
    elsif (Time.now - self.created_at) < 60 * 60 * 24
      # 24時間以内なら
      ((Time.now - self.created_at) / 3600).to_i.to_s + "時間前"
    else
      # それ以降
      (Date.today - self.created_at.to_date).to_i.to_s + "日前"
    end
  end
end
