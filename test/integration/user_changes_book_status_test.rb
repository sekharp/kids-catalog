class UserChangesBookStatusTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = KidsCatalog::Application
    stub_omniauth
    login_user
    @book = Book.create(title: "A book", author_first_name: "Sekhar", author_last_name: "Paladugu", isbn: "0689857578")
    stub_request(:get, "http://covers.openlibrary.org/b/isbn/0689857578-L.jpg").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Hurley v0.2'}).
      to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, "https://www.googleapis.com/books/v1/volumes?maxResults=5&q=0689857578&startIndex=0").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end

  test "user can favorite book" do
    book = Book.first
    visit all_books_path
  end
end
