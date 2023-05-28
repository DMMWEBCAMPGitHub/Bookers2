class UsersController < ApplicationController

 
  # GET /users or /users.json
  def index
    @user = current_user
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    
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
    @user.update(user_params)  #ユーザーのアップデート
    redirect_to user_path(@user.id)  #ユーザーの詳細ページへのパス
    flash[:notice] = "You have updated user successfully."
  end



  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end