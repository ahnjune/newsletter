class AccountsController < ApplicationController
  
  before_filter :set_nav
  
  private
  
  def set_nav
    @nav = :account
  end
  
end