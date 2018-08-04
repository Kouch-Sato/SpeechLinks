class AdminController < ApplicationController
  before_action :ensure_admin_user
  before_action :authenticate_user!
  layout "admin"

  private
  def ensure_admin_user
    if current_user.id != 1 && current_user.id != 2
      redirect_to user_speeches_path, alert: "管理画面に入る権限がありません"
    end
  end
end