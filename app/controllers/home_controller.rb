require 'rest-client'
require "audit_rails/version"

class HomeController < ApplicationController

  def index
    @user = User.new unless session[:current_user]
    @users = User.all.map(&:name)
    @visitor_count = AuditRails::Audit.visitor_count
    @unique_visitor_count = AuditRails::Audit.unique_visitor_count
  end

  def about; end

  def gem_count
    response =  RestClient.get(GEM_DOWNLOAD_COUNT_URL + AuditRails::VERSION + '.json')
    render json: response
  end
end