class Book < ActiveRecord::Base
  def cover_url(isbn)
    service_connection = LibraryService.new
    service_connection.cover_url(isbn)
  end

end
