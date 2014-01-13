class UsersController < ApplicationController
  before_action :set_current_user, except: [:login]
  before_action :set_user, only: [:show]
  before_action :find_user, only: [:login]
  before_action :add_instance_variables, only: [:index, :show]

  def login
    session[:current_user] = @user
    if @user
      redirect_to users_url
    else
      @user = User.new
      render 'home/index'
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to root_url
  end

  def index
  end

  def show
    render action: 'index'
  end

  def create
    @new_user = User.new(user_params)
    @users = User.all
    respond_to do |format|
      if @new_user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
      else
        format.html { render action: 'index' }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def add_instance_variables
      @new_user = User.new
      @users = User.sorted_user
    end

    def find_user
      @user = User.find_by_name(params[:user][:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
