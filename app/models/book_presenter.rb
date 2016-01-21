require 'googlebooks'

class BookPresenter
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def user_books
    self.user_books
  end

  def book_id
    self.book.id
  end

  def author_name
    self.book.author_first_name + " " + self.book.author_last_name
  end

  def isbn
    self.book.isbn
  end

  def title
    self.book.title
  end

  def cover_url
    self.book.cover_url(self.book.isbn)
  end

  def open_library_data
    self.book.open_library_data(self.book.isbn)
  end

  def subjects
    self.open_library_data[:subjects]
  end

  # :nocov:
  def google_books_data
    parse(googlebooks(self.isbn))
  end
  # :nocov:

  def description
    self.google_books_data[:items][0][:volumeInfo][:description] unless self.google_books_data[:items].nil?
  end

  private

  def googlebooks(isbn)
    GoogleBooks.search(isbn).response
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
