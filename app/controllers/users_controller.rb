class UsersController < ApplicationController
  def index
    @users = User.all.order('updated_at DESC')
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end
  
  def create
    @user = User.new(nickname: params[:nickname], email: params[:email], password: params[:password])
    @user.save
#TODO: 新規登録でデータが保存された後は、ログイン後のtopページであるホスト一覧画面（スライドのp.14)へリダイレクト 
#NOTE: 現段階ではひとまずユーザ詳細ページへリダイレクト
    redirect_to("/users/#{@user.id}")
  end

end
