require './test/test_helper'

class UserTest < ActiveSupport::TestCase
  # rubocop:disable Metrics/BlockLength
  test 'user can be found' do
    auth_info = OmniAuth::AuthHash.new(provider: 'google_oauth2',
                                       uid: '102656813292713106611',
                                       info: {
                                         name: 'Google User',
                                         email: 'sekharp@gmail.com',
                                         first_name: 'Google',
                                         last_name: 'User',
                                         image: ''
                                       },
                                       credentials: {
                                         token: 'token',
                                         refresh_token: 'another_token',
                                         expires_at: 1_354_920_555,
                                         expires: true
                                       },
                                       extra: {
                                         # CookieOverflow exception test
                                         id_token: Array.new(1000) { 'string' }
                                          .join,
                                         raw_info: OmniAuth::AuthHash.new(
                                           email: 'test@example.com',
                                           email_verified: 'true',
                                           kind: 'plus#personOpenIdConnect',
                                           name: 'Test Person'
                                         )
                                       })
    User.create_or_find_by_auth(auth_info)
    user = User.last

    assert_equal '102656813292713106611', user.uid
    assert_equal 'Google', user.first_name
    assert_equal 'User', user.last_name
    assert_equal 'sekharp@gmail.com', user.email
  end

  test "user's favorite books" do
    auth_info = OmniAuth::AuthHash.new(provider: 'google_oauth2',
                                       uid: '102656813292713106611',
                                       info: {
                                         name: 'Google User',
                                         email: 'sekharp@gmail.com',
                                         first_name: 'Google',
                                         last_name: 'User',
                                         image: ''
                                       },
                                       credentials: {
                                         token: 'token',
                                         refresh_token: 'another_token',
                                         expires_at: 1_354_920_555,
                                         expires: true
                                       },
                                       extra: {
                                         # CookieOverflow exception test
                                         id_token: Array.new(1000) { 'string' }
                                          .join,
                                         raw_info: OmniAuth::AuthHash.new(
                                           email: 'test@example.com',
                                           email_verified: 'true',
                                           kind: 'plus#personOpenIdConnect',
                                           name: 'Test Person'
                                         )
                                       })
    User.create_or_find_by_auth(auth_info)
    user = User.last

    book = Book.create(title: 'Test Book')
    UserBook.create(user_id: user.id,
                    book_id: book.id,
                    favorited: true,
                    read: false)

    Book.create(title: 'Test Book Two')
    UserBook.create(user_id: user.id,
                    book_id: book.id,
                    favorited: false,
                    read: false)

    assert_equal [book], user.favorite_books
  end
  # rubocop:enable Metrics/BlockLength
end
