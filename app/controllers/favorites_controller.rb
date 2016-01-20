class FavoritesController < ApplicationController
  before_action :require_login

  def create
    UserBook.create(book_id: params[:book_id], user_id: params[:user_id], favorited: params[:favorited])
    book = Book.find(params[:book_id])
    redirect_to book_path(id: book.id)
    flash[:success] = "Successfully marked as favorite the book #{book.title}!"
  end

  def update
    book = Book.find(params[:book_id])
    if params[:favorited] == "true"
      user_book = UserBook.where(book_id: params[:book_id], user_id: params[:user_id]).first
      user_book.update(:favorited => true)
      flash[:success] = "Successfully added favorite status for the book #{book.title}."
    elsif params[:favorited] == "false"
      user_book = UserBook.where(book_id: params[:book_id], user_id: params[:user_id]).first
      user_book.update(:favorited => false)
      flash[:success] = "Successfully removed favorite status for the book #{book.title}."
    elsif params[:read] == "true"
      user_book = UserBook.where(book_id: params[:book_id], user_id: params[:user_id]).first
      user_book.update(:read => true)
      flash[:success] = "Successfully added mark as read status for the book #{book.title}."
    else
      user_book = UserBook.where(book_id: params[:book_id], user_id: params[:user_id]).first
      user_book.update(:read => false)
      flash[:success] = "Successfully removed mark as read status for the book #{book.title}."
    end
    redirect_to book_path(id: book.id)
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
