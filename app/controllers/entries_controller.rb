class EntriesController < ApplicationController

  # 予約履歴全件表示（管理者のみ見れる）
  def index
    @entries =  Entry.all.includes(:event)
  end

  # 予約画面表示
  def new
  end

  # 予約機能
  def create
  end

  # 自身の予約履歴参照機能
  def show
  end
end
