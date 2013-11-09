class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user
  # To log every single action in your application
  after_action :audits, except: [:set_current_user, :login]  

  private

  def set_current_user
    if session[:current_user]
      @current_user = session[:current_user]
      add_to_audit('login', 'users', @current_user.name)
    else
      redirect_to '/'
    end
  end

  def current_user
    @current_user = session[:current_user]
  end

  def audits
    user_name = @current_user ? @current_user.name : 'Anonymous'
    add_to_audit(action_name, controller_name, user_name)
  end
end
