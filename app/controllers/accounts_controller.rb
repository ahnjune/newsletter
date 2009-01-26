class AccountsController < ApplicationController
  
  before_filter :set_nav
  before_filter :login_required
  
  def update
    if current_user.update_attributes params[:user]
      flash[:notice] = "Account Updated"
      redirect_to edit_account_path and return
    end
    render :action => "edit"
  end
  
  private
  
  def set_nav
    @nav = :account
  end
  
end