class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins = User.paginate(page: params[:page])
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "ユーザを削除しました"
    redirect_to admins_path
  end
end
