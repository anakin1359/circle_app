class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
    flash[:alert] = "[エラー] 権限がありません"
  end
end
