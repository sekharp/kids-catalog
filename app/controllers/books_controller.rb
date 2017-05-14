require 'googlebooks'

class BooksController < ApplicationController
  def index
    @recent_books = Book.all.order('created_at DESC').first(4)
    @teacher_books = Book.find([1, 11, 33, 49])
  end

  def show
    @show_book = BookPresenter.new(Book.find(params[:id]))
  end

  def all
    @all_books = Book.all
  end
end
