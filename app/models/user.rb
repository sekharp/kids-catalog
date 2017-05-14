class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books
  validates_presence_of :email

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.create_or_find_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.provider         = auth['provider']
    user.uid              = auth['uid']
    user.first_name       = auth['info']['first_name']
    user.last_name        = auth['info']['last_name']
    user.email            = auth['info']['email']
    user.image_url        = auth['info']['image']
    user.token            = auth['credentials']['token']
    user.token_expires_at = Time.at(auth['credentials']['expires_at'])

    user.save
    user
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def favorite_books
    book_ids = user_books.where(favorited: true).pluck(:book_id)
    Book.find(book_ids)
  end

  def read_books
    book_ids = user_books.where(read: true).pluck(:book_id)
    Book.find(book_ids)
  end
end
