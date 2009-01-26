class InvitesController < ApplicationController
  
  before_filter :set_nav
  
  def create
    flash[:notice] = "Invites sent! Thank you."
    redirect_to new_invite_path
  end
  
  private
  
  def set_nav
    @nav = :invites
  end
  
end