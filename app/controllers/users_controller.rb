class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy

  # ユーザ情報を一覧で表示
  def index
    @users = User.paginate(page: params[:page])
  end

  # 登録したイベントを一覧で表示
  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  # ユーザ削除機能
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to users_path
  end

  private

  # ここで指定した項目のみweb経由での変更を許可にする
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :description,
      :user_icon
    )
  end

  # adminユーザでない場合はホーム画面にリダイレクトさせる
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
