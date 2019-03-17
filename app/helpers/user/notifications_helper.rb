module User::NotificationsHelper
  def user_notifications_index_meta_tags
    {
      title: '通知一覧',
      noindex: true
    }
  end
end