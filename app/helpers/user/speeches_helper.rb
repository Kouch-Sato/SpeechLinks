module User::SpeechesHelper
  def user_speeches_edit_meta_tags
    {
      title: 'スピーチ編集',
      noidex: true
    }
  end

  def user_speeches_index_meta_tags
    {
      title: 'スピーチ一覧'
    }
  end

  def user_speeches_new_meta_tags
    {
      title: 'スピーチ新規作成',
      noidex: true
    }
  end

  def user_speeches_show_meta_tags
    {
      title: @speech.title,
      description: @speech.overview,
      og: {
        image: File.join(root_url, @speech.user.image.thumb.url)
      }
    }
  end
end