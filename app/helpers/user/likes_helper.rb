module User::LikesHelper
  def user_likes_index_meta_tags
    {
      title: @speech.title,
      noindex: true
    }
  end
end