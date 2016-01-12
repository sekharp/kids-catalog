class BooksController < ApplicationController
  def index
    @book = service_connection.client.book('OL7730286M')
  end

  def show
    @book = service_connection.client.book('OL7730286M')
  end
end
