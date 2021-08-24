class EntriesController < ApplicationController

  # 予約履歴全件表示
  def index
    @entries =  Entry.where(user_id: current_user.id)
  end

  # イベント予約機能
  def new
    @event = Event.find(params[:event_id])
    @entry = Entry.new
  end

  # イベント予約実行機能
  def create
    @entry = current_user.entry.build(entry_params)
    @event = Event.find(params:[:event_id])
    @entry.event_id = @event.id
    if @entry.save
      flash[:notice] = "イベント予約が完了しました"
      redirect_to user_path(current_user.id)
    else
      render event_entry_path(@event.id)
    end
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
