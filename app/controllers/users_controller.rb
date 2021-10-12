class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :description,
      :user_icon
    )
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
