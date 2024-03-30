class Users::PasswordlessController < Devise::Passwordless::SessionsController
  def create
    if params[:user].nil? || params[:user][:email].nil?
      return redirect_to new_user_session_path, alert: "Please enter an email address"
    end
    user = User.find_by(email: params[:user][:email])
    unless user
      user = User.create(email: params[:user][:email])      
    end
    user.send_magic_link
    redirect_to new_user_session_path, notice: "Magic link sent!"
  end
end