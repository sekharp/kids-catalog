require 'googlebooks'

class BookPresenter
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def user_books
    user_books
  end

  def book_id
    book.id
  end

  def author_name
    book.author_first_name + ' ' + book.author_last_name
  end

  def isbn
    book.isbn
  end

  def title
    book.title
  end

  def cover_url
    book.cover_url(book.isbn)
  end

  def open_library_data
    book.open_library_data(book.isbn)
  end

  def subjects
    open_library_data[:subjects]
  end

  def google_books_data
    parse(googlebooks(isbn))
  end

  def description
    google_books_data[:items][0][:volumeInfo][:description] unless google_books_data[:items].nil?
  end

  private

  def googlebooks(isbn)
    GoogleBooks.search(isbn).response
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
