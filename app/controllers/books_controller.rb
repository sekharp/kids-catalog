class BooksController < ApplicationController
  def index
    @book = service_connection.client.book('OL7730286M')
    @book_two = service_connection.client.book('OL1565969M')
  end

  def show
    isbn =
    @book = service_connection.client.book('OL7730286M')
  end
end
