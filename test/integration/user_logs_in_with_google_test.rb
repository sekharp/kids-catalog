require 'test_helper'

class UserLogsInWithGoogleTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = KidsCatalog::Application
    stub_omniauth
  end

  test "visitor can use google oauth to sign in" do
    visit root_path

    click_link "Login"

    click_link "Sign in with Google"

    assert_equal root_path, current_path
    assert page.has_content?("Logout")

    visit dashboard_path

    assert page.has_content?("Profile")
    assert page.has_content?("Google")
    assert page.has_content?("User")
  end
end