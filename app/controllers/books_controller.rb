require 'googlebooks'

class BooksController < ApplicationController
  def index
    @book_sample = Book.all.sample(4)
    @book_sample_two = Book.all.sample(4)
    @book_sample_three = Book.all.sample(4)
  end

  def show
    @book = Book.find(params[:id])
    @cover_url = @book.cover_url(@book.isbn)
    @book_info = GoogleBooks.search(@book.isbn).response
  end

  def all
    @all_books = Book.all
  end
end
