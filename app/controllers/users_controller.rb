class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  # GET /users or /users.json
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])  #ユーザーの取得
    if @user.update(user_params)  #ユーザーのアップデート
    redirect_to user_path(@user.id)  #ユーザーの詳細ページへのパス
    flash[:notice] = "You have updated user successfully."
    else
    render :edit
    end
  end



  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
  end

  end

end