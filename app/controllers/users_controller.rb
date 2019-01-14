class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(nickname: params[:nickname], email: params[:email], password: params[:password])
    if @user.save
#TODO: 新規登録でデータが保存された後は、ログイン後のtopページであるホスト一覧画面（スライドのp.14)へリダイレクト 
#NOTE: 現段階ではひとまずユーザ詳細ページへリダイレクト
    redirect_to("/users/#{@user.id}")
    flash[:notice] = "ユーザー登録が完了しました"
    else
      render("users/new")
    end 
  end

end
