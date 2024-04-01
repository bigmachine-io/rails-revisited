class ApplicationController < ActionController::Base
  
  def is_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end

end
