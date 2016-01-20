module BooksHelper
  def favorite_button_for(show_book)
    if show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id).empty?
      'books/first_time_favorite_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: true, read: true).present?
      'books/remove_favorite_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: true, read: false).present?
      'books/remove_favorite_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: false, read: true).present?
      'books/favorite_button'
    else
      'books/favorite_button'
    end
  end

  def mark_as_read_button_for(show_book)
    if show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id).empty?
      'books/first_time_read_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: true, read: true).present?
      'books/remove_read_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: true, read: false).present?
      'books/read_button'
    elsif show_book.book.user_books.where(book_id: show_book.book_id, user_id: current_user.id, favorited: false, read: true).present?
      'books/remove_read_button'
    else
      'books/read_button'
    end
  end
end
