# frozen_string_literal: true

# Used as Spina's authentication module
module BigAuth
  extend ActiveSupport::Concern

  included do
    helper_method :current_spina_user
    helper_method :logged_in?
    helper_method :logout_path
  end

  # Spina user falls back to devise user session in the case there is one and it is of a superadmin.
  def current_spina_user
    Spina::Current.user ||= current_user if current_user.is_admin?
  end

  # Returns falsy unless there is a logged in superadmin
  def logged_in?
    return current_spina_user if user_signed_in?
    false
  end

  # Not used
  def logout_path
    spina.admin_logout_path
  end

  private

  # Redirects user to sign in if not logged in as a superadmin
  def authenticate
    redirect_to "/login" unless logged_in?
  end
end