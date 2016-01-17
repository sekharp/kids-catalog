class Book < ActiveRecord::Base
  def cover_url(isbn)
    service_connection = LibraryService.new
    service_connection.cover_url(isbn)
  end

  def open_library_data(isbn)
    service_connection = LibraryService.new
    service_connection.book(isbn)
  end
end
