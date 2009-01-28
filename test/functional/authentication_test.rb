require "#{File.dirname(__FILE__)}/../test_helper"

class AuthenticationTest < ActionController::IntegrationTest

  def test_login
    user = Factory(:user)
    
    # get the login page
    get "/login"
    assert_equal 200, status

    # post the login and follow through to the home page
    post "/session", :login => user.login, :password => "secret"
    follow_redirect!
    
    # assert user redirected to the root page
    assert_equal 200, status
    assert_equal "/", path
  end
end
