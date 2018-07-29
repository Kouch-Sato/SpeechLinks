class Admin::LikesController < AdminController
  def index
    @likes = Like.all.order("created_at DESC")
  end
end
