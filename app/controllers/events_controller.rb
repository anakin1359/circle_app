class EventsController < ApplicationController

  # 登録済みイベント全件表示（ユーザも見れる）
  def index
    @events = Event.all
  end

  # イベント新規登録
  def new
    @event = Event.new
  end

  # イベント登録機能（失敗したら現ページに残留）
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "イベント登録が完了しました"
      redirect_to user_path(current_user.id)
    else
      render new_event_path
    end
  end

  # ユーザ毎の登録済みイベント一覧表示（ユーザは見れない）
  def show
    # binding.pry
  end

  # イベントIDを取得して更新対象のイベントを特定
  def edit
    @event = Event.find(params[:id])
  end

  # イベント更新機能（失敗したら現ページに残留）
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "イベントを更新しました"
      redirect_to events_path
    else
      flash[:alert] = "イベントの更新に失敗しました"
      render edit_event_path(@event.id)
      # render edit
    end
  end

  # イベント削除機能
  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to events_path
  end

  private

  # ここで指定した項目のみweb経由での変更を許可にする
  def event_params
    params.require(:event).permit(
      :title,
      :introduction,
      :start_date,
      :end_date,
      :entry_count,
      :event_price,
      :address,
      :event_icon
    )
  end
end
