class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :hipchat_rooms

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    auth_token = access_token.credentials.token
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    user.auth_token = auth_token
    if user && user.save
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      registered_user.auth_token = auth_token
      if registered_user && registered_user.save
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          password: Devise.friendly_token[0,20],
          auth_token: auth_token,
        )
      end
    end
  end

end
