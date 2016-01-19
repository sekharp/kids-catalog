class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "visitor can see login link" do
    visit root_path

    within("#primary-navigation") do
      assert page.has_content?("Login")
    end
  end

  test "visitor can create account and sign in" do
    visit root_path

    click_link "Create Account"

    fill_in "First name", with: "Sekhar"
    fill_in "Last name", with: "Paladugu"
    fill_in "Grade", with: "3"
    fill_in "Email", with: "sekharp@gmail.com"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert_equal '/dashboard', current_path
    within("#nav-bar") do
      assert page.has_content?("Logged in as Sekhar Paladugu")
    end
    within("#profile") do
      assert page.has_content?("Profile")
      assert page.has_content?("Sekhar")
    end
    within("#primary-navigation") do
      refute page.has_content?("Login")
      assert page.has_content?("Logout")
    end
  end

  test "user can login and logout" do
    skip
    User.create(first_name: "Sekhar",
                last_name: "Paladugu",
                grade: "3",
                email: "sekharp@gmail.com",
                password: "password")

    visit root_path

    click_link "Login"
    fill_in "Email", with: "sekharp@gmail.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal dashboard_path, current_path
    within("#primary-navigation") do
      refute page.has_content?("Login")
      assert page.has_content?("Logout")
    end

    click_link "Logout"

    within("#primary-navigation") do
      assert page.has_content?("Login")
      refute page.has_content?("Logout")
    end
  end
end
