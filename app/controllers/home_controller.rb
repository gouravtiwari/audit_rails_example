class HomeController < ApplicationController

  def index
    @user = User.new unless session[:current_user]
    @visitor_count = AuditRails::Audit.visitor_count
    @unique_visitor_count = AuditRails::Audit.unique_visitor_count
  end
end