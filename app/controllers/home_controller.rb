class HomeController < ApplicationController
  def top
    @new_speeches = Speech.all.order("created_at DESC").limit(3)
    @random_speeches = Speech.all.order("RAND()").limit(3)
    @commented_speeches = Comment.all.order("created_at DESC").limit(3).map(&:speech)
    if user_signed_in?
      @my_speeches = current_user.speeches.order("created_at DESC").limit(3)
      @my_liked_speeches = current_user.likes.order("created_at DESC").limit(3).map(&:speech)
    end
  end

  def help
  end
end
