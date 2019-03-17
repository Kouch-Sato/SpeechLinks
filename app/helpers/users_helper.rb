module UsersHelper
  def users_edit_meta_tags
    {
      title: 'プロフィール編集',
      noindex: true
    }
  end

  def users_index_meta_tags
    {
      title: 'スピーカー一覧'
    }
  end

  def users_show_meta_tags
    {
      title: @user.name,
      description: @user.bio
    }
  end
end
