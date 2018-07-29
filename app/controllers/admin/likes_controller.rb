class Admin::LikesController < ApplicationController
  def index
    @likes = Like.all.order("created_at DESC")
  end
end
