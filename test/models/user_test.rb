require 'test_helper'

class UserTest < ActiveSupport::TestCase
  valid_params = { first_name: "Pumpkin",
                   last_name:  "Burgess",
                   grade:      "2",
                   email:      "pumpkinburgess@yahoo.com",
                   password:   "iloveblankets" }

  def auth_info
   OmniAuth::AuthHash.new({
       'provider' => 'Google',
       'uid' => '12345',
       'info' => { 'first_name' => 'Sekhar', 'last_name' => 'sekharp', 'email' => 'sekharp@gmail.com', 'image_url' => 'sekharp.github.io/image.jpg'},
       'credentials' => {'token' => '67', 'token_expires_at' => '89' }
     })
  end

  test "user can be found" do
   User.create_or_find_by_auth(auth_info)
   user = User.last

   assert_equal '12345', user.uid
   assert_equal 'Sekhar', user.name
   assert_equal 'sekharp', user.screen_name
   assert_equal '67', user.oauth_token
   assert_equal '89', user.oauth_token_secret
  end

  # test "it is valid with correct params" do
  #   user = User.new(valid_params)
  #   assert user.valid?
  # end

end
