class FavoritesController < ApplicationController
  before_action :require_login

  def create
    BooksUsers.create(book_id: params[:book_id], user_id: params[:user_id], favorited: params[:favorited])
    book = Book.find(params[:book_id])
    redirect_to book_path(id: book.id)
    flash[:success] = "Successfully marked as favorite the book #{book.title}!"
  end

  def update
    if params[:favorited] == false
      book_user = BooksUsers.where(book_id: params[:book_id], user_id: params[:user_id]).first
      book_user.update(:favorited => true)
    else
      book_user = BooksUsers.where(book_id: params[:book_id], user_id: params[:user_id]).first
      book_user.update(:favorited => false)
    end
    book = Book.find(params[:book_id])
    redirect_to book_path(id: book.id)
    flash[:success] = "Successfully updated favorite status for the book #{book.title}."
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
