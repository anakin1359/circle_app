class EntriesController < ApplicationController

  # 予約履歴全件表示（管理者のみ見れる）
  def index
    @entries =  Entry.all.includes(:event)
  end

  # イベント予約機能
  def new
    @event = Event.find(params[:event_id])
    @entry = Entry.new
  end

  # イベント予約実行機能
  def create

  end

  # 自身の予約履歴参照機能
  def show

  end

  private

    # ここで指定した項目のみweb経由での変更を許可にする
    def entry_params
      params.require(:entry).permit(
        :entry_name,
        :entry_count,
        :entry_price
      )
    end
end
