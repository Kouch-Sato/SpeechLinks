namespace :likes do
  desc "自分のスピーチのlikeを削除する"
  task :delete_owners_like => :environment do
    Like.all.each do |like|
      if like.speech.user_id == like.user.id
        like.destroy
        like.save
      end
    end
  end
end