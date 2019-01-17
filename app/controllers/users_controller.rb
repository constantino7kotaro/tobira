class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
end
