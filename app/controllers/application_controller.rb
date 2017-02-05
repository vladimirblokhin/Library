class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:login,:email, :password, :password_confirmation, :current_password)
    }
  end

  helper_method :current_user_can_edit?

  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user ||
        (model.try(:comment).present? && model.comment.user == current_user))
  end
end
