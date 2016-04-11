class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    User.where(
      provider: auth["provider"],
      uid: auth["info"]["id"],
      name: auth["info"]["display_name"]
    ).first_or_create
  end
end
