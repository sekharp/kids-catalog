class UserChangesBookStatusTest < ActionDispatch::IntegrationTest
  test "user can favorite book" do
    User.create(first_name: "Sekhar",
                last_name: "Paladugu",
                grade: "3",
                email: "sekharp@gmail.com")

    visit "/books/1"

    save_and_open_page

    within("#primary-navigation") do
      assert page.has_content?("Login")
    end
  end
end
