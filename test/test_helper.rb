ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start('rails')

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock/minitest'
require 'vcr'

module ActiveSupport
  class TestCase
    VCR.configure do |config|
      config.cassette_library_dir = 'test/cassettes'
      config.hook_into(:webmock)
    end
  end
end

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL
    DatabaseCleaner.strategy = :transaction

    def setup
      DatabaseCleaner.start
    end

    def teardown
      DatabaseCleaner.clean
      reset_session!
      OmniAuth.config.mock_auth[:google] = nil
    end

    # rubocop:disable Metrics/MethodLength
    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] =
        OmniAuth::AuthHash.new(provider: 'google_oauth2',
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
                                 # this section tests CookieOverflow exception
                                 id_token: Array.new(1000) { 'string' }.join,
                                 raw_info: OmniAuth::AuthHash.new(
                                   email: 'test@example.com',
                                   email_verified: 'true',
                                   kind: 'plus#personOpenIdConnect',
                                   name: 'Test Person'
                                 )
                               })
    end
    # rubocop:enable Metrics/MethodLength

    def login_user
      visit root_path
      click_link 'Login'
      click_link 'Sign in with Google'
    end
  end
end
