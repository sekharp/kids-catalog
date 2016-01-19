class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books

  def cover_url(isbn)
    service_connection = LibraryService.new
    service_connection.cover_url(isbn)
  end

  def open_library_data(isbn)
    service_connection = LibraryService.new
    service_connection.book(isbn)
  end
end
