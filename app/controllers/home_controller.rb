class HomeController < ApplicationController

  def index
    p "session[:current_user]: #{session[:current_user]}"
    @user = User.new unless session[:current_user]
  end
end