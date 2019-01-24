class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end

  def edit
    @user = User.find(id: params[:id])
  end

  def update
    @user = User.find(id: params[:id])
    @user.nickname = params[:nickname]
    @user.introduction = params[:introduction]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read )
    end
    
    if @user.save
      flash[:notice] = "プロフィールを編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/profile_edit")
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end

