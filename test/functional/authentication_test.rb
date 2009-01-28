require "#{File.dirname(__FILE__)}/../test_helper"

class AuthenticationTest < ActionController::IntegrationTest

  def test_login
    user = Factory(:user)
    
    # get the login page
    get "/login"
    assert_equal 200, status

    # post the login and follow through to the home page
    post "/session", :login => user.login, :password => "secret"

    # by default you go straight to the recommendations on login
    follow_redirect!
    assert_equal "/", path
    
    # new users should be shown the tags screen from here
    follow_redirect!
    assert_equal "/tags", path
    
  end
  
  
  
end
