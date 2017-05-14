require 'test_helper'

class VisitorLooksAtBooksTest < ActionDispatch::IntegrationTest
  attr_reader :book

  def setup
    Capybara.app = KidsCatalog::Application
    @book = Book.create(title: 'A book', author_first_name: 'Sekhar', author_last_name: 'Paladugu', isbn: '0689857578')
  end

  test 'visitor can see login link' do
    visit root_path

    within('#primary-navigation') do
      assert page.has_content?('Login')
    end
  end

  test 'visitor can see book show page' do
    VCR.use_cassette('visitor') do
      book = Book.first
      visit "/books/#{book.id}"
    end
  end
end
