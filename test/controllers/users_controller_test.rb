require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test '#new sets up a new user' do
    get :new
    assert_response :success
  end

  test '#create saves a new user' do
    post :create, first_name: 'Sekhar', last_name: 'Paladugu', email: 'sekharp@gmail.com'
    assert_redirected_to(dashboard_path)
  end

  test '#create does not save a new user with bad data' do
    post :create, bonnet: 'Josh Cheek'
    assert_response 200
  end

  test '#show displays login path when not logged in' do
    get :show
    assert_redirected_to(login_path)
  end
end
