require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  test '#create creates a UserBook instance' do
    book = Book.create
    user = User.create
    post :create, book_id: book.id, user_id: user.id, favorited: true
    assert_redirected_to(book_path(id: book.id))
  end

  test '#update updates a UserBook instance with mark favorite' do
    book = Book.create
    user = User.create
    user_book = UserBook.create(book_id: book.id, user_id: user.id, favorited: true, read: true)

    patch :update, 'book_id' => book.id, 'favorited' => 'true', 'user_id' => user.id, 'controller' => 'favorites', 'action' => 'update', 'id' => user_book.id
    assert_redirected_to(book_path(id: book.id))
  end

  test '#update updates a UserBook instance with remove favorite' do
    book = Book.create
    user = User.create
    user_book = UserBook.create(book_id: book.id, user_id: user.id, favorited: true, read: true)

    patch :update, 'book_id' => book.id, 'favorited' => 'false', 'user_id' => user.id, 'controller' => 'favorites', 'action' => 'update', 'id' => user_book.id
    assert_redirected_to(book_path(id: book.id))
  end

  test '#update updates a UserBook instance with mark as read' do
    book = Book.create
    user = User.create
    user_book = UserBook.create(book_id: book.id, user_id: user.id, favorited: true, read: true)

    patch :update, 'book_id' => book.id, 'read' => 'true', 'user_id' => user.id, 'controller' => 'favorites', 'action' => 'update', 'id' => user_book.id
    assert_redirected_to(book_path(id: book.id))
  end

  test '#update updates a UserBook instance with remove mark as read' do
    book = Book.create
    user = User.create
    user_book = UserBook.create(book_id: book.id, user_id: user.id, favorited: true, read: true)

    patch :update, 'book_id' => book.id, 'read' => 'false', 'user_id' => user.id, 'controller' => 'favorites', 'action' => 'update', 'id' => user_book.id
    assert_redirected_to(book_path(id: book.id))
  end
end
