class ApplicationController < ActionController::Base
  # セキュリティ対策
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected
  def configure_permitted_parameters
    # sign_inのときに、usernameなどの情報も許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :university, :grade])
  end
end
