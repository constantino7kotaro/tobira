class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end
end
