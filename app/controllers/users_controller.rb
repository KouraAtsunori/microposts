class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :corrent_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if@user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to@user
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)
  end
  
  #ログイン済みのユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_path
    end
  end
  
  #正しいユーザーかどうか確認
  def corrent_user
    # @user = User.find(params[:id])  存在していないとエラー
    @user = User.find_by(id: params[:id])   #存在していない IDではnil エラーにはしない
    redirect_to(root_url) unless (current_user == @user)
  end
  
end
