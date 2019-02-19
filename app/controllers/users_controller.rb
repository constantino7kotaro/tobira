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
    @user.name = params[:user][:name]
    @user.nickname = params[:user][:nickname]
    @user.introduction = params[:user][:introduction]
    @user.age = params[:user][:age]
    
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
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/lessons/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")
  end
end
