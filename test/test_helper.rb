ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

include AuthenticatedTestHelper

class Test::Unit::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

end

# http://github.com/thoughtbot/factory_girl/tree/master

Factory.define :user do |u|
  u.first_name "John"
  u.last_name  "Doe"
  u.password "secret"
  u.password_confirmation "secret"
  u.login "john"
  u.email "john.doe@company.com"
  u.admin false
end


