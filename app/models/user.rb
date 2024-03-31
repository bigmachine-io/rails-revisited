class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :magic_link_authenticatable, :validatable, :rememberable,
    :omniauthable, omniauth_providers: %i[github]

  def is_admin?
    return true if email =="robconery@gmail.com"
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create!(
        email: auth.info.email,
        provider: auth.provider, 
        uid: auth.uid,
        name: auth.info.name
      )
    end
    user
  end

end
