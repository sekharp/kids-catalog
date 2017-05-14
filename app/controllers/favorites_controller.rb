class FavoritesController < ApplicationController
  def create
    if params[:favorited]
      UserBook.create(book_id: params[:book_id], user_id: params[:user_id], favorited: params[:favorited])
      book = Book.find(params[:book_id])
      redirect_to book_path(id: book.id)
      flash[:success] = "Successfully marked as favorite the book #{book.title}!"
    else
      UserBook.create(book_id: params[:book_id], user_id: params[:user_id], read: params[:read])
      book = Book.find(params[:book_id])
      redirect_to book_path(id: book.id)
      flash[:success] = "Successfully marked as read the book #{book.title}!"
    end
  end

  def update
    book = Book.find(params[:book_id])
    user_book = UserBook.where(book_id: params[:book_id], user_id: params[:user_id]).first
    if params[:favorited] == 'true'
      user_book.update(favorited: true)
      flash[:success] = "Successfully marked as favorite the book #{book.title}."
    elsif params[:favorited] == 'false'
      user_book.update(favorited: false)
      flash[:success] = "Successfully removed favorite status for the book #{book.title}."
    elsif params[:read] == 'true'
      user_book.update(read: true)
      flash[:success] = "Successfully marked as read the book #{book.title}."
    else
      user_book.update(read: false)
      flash[:success] = "Successfully removed mark as read status for the book #{book.title}."
    end
    redirect_to book_path(id: book.id)
  end
end
