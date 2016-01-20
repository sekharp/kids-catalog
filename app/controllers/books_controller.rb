require 'googlebooks'

class BooksController < ApplicationController
  def index
    @recent_books = Book.all.order("created_at DESC").first(4)
    @teacher_books = Book.find([1, 26, 105, 125])
  end

  def show
    @show_book = BookPresenter.new(Book.find(params[:id]))
    # @cover_url = @book.cover_url(@book.isbn)
    # @book_ol_data = @book.open_library_data(@book.isbn)
    # @book_subjects = @book_ol_data[:subjects]
    # @book_info = parse(googlebooks(@book.isbn))
    # @book_description = @book_info[:items][0][:volumeInfo][:description] unless @book_info[:items].nil?
  end

  def all
    @all_books = Book.all
  end
end
