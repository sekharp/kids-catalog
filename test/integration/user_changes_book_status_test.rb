require 'test_helper'

class UserChangesBookStatusTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = KidsCatalog::Application
    stub_omniauth
    login_user
    @book = Book.create(title: 'A book', author_first_name: 'Sekhar', author_last_name: 'Paladugu', isbn: '0689857578')
  end

  test 'user can favorite book' do
    VCR.use_cassette('favoriting') do
      book = Book.first
      visit all_books_path
      visit "/books/#{book.id}"
      click_button 'Mark As Read'
      click_button 'Favorite'
    end
  end
end
