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
    @book_ol_data = @book.open_library_data(@book.isbn)
    @book_info = parse(googlebooks(@book.isbn))
    @book_description = @book_info[:items][0][:volumeInfo][:description] unless @book_info[:items].nil?
  end

  def all
    @all_books = Book.all
  end
end
