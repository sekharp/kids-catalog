class User < ActiveRecord::Base
  has_secure_password
  has_many :books_users
  # has_many :books, through: :books_users
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true
  validates :grade, presence: true

  def self.create_or_find_by_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.provider         = auth.provider
    user.uid              = auth.uid
    user.first_name       = auth.info.first_name
    user.last_name        = auth.info.last_name
    user.email            = auth.info.email
    user.image_url        = auth.info.image
    user.token            = auth.credentials.token
    user.token_expires_at = Time.at(auth.credentials.expires_at)

    user.save
    user
  end
end
