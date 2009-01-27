class InvitesController < ApplicationController
  
  before_filter :set_nav
  
  def create
    params[:invite][:emails].split("\n").each do |email|
      Mailer.deliver_invite current_user, email
    end
    flash[:notice] = "Thank you!"
    redirect_to new_invite_path
  end
  
  private
  
  def set_nav
    @nav = :invites
  end
  
end