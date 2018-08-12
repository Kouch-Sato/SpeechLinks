namespace :create_notifications do
  desc "LikeからNotificationを作成する"
  task :likes => :environment do
    Like.all.each do |like|
      if like.user_id == like.speech.user_id
        next
      end
      Notification.create(
        user_id: like.speech.user_id,
        notified_by_id: like.user_id,
        speech_id: like.speech_id,
        notified_type: "読んだ！",
        read: false,
        created_at: like.created_at
      )
    end
  end

  desc "CommentからNotificationを作成する"
  task :comments => :environment do
    Comment.all.each do |comment|
      if comment.user_id == comment.speech.user_id
        next
      end
      Notification.create(
        user_id: comment.speech.user_id,
        notified_by_id: comment.user_id,
        speech_id: comment.speech_id,
        notified_type: "コメント",
        read: false,
        created_at: comment.created_at
      )
    end
  end
end
