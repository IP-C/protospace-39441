class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @prototypes = @user.prototypes
      # ユーザーの詳細情報を表示するアクション
  end
  
  def edit
      # ユーザー情報を編集するフォームを表示するアクション
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :profile, :occupation, :position)
  end
  
  
end
