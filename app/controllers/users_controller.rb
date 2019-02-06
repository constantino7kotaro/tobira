class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(nickname: params[:user][:nickname],
                    email: params[:user][:email],
                    password: params[:user][:password])
                    #TODO:初期画像が設定されるようにする
                    #image_name: "default_user.jpg"
    if @user.save
      #TODO: 新規登録でデータが保存された後は、ログイン後のtopページであるホスト一覧画面（スライドのp.14)へリダイレクト
      #NOTE: 現段階ではひとまずユーザ詳細ページへリダイレクト
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー登録が完了しました"
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.nickname = params[:user][:nickname]
    @user.introduction = params[:user][:introduction]
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read )
    end
    
    if @user.save
      flash[:notice] = "プロフィールを編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
