module Devise::RegistrationsHelper
  def devise_registrations_new_meta_tags
    {
      title: '新規登録'
    }
  end
end