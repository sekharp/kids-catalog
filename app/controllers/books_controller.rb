class BooksController < ApplicationController
  def index
    @book = service_connection.book('0689857578')
    @book_two = service_connection.book('067084487X')
  end

  def show
    @book = service_connection.book('0689857578')
  end

  def all
    @all_books = Book.all
  end
end
