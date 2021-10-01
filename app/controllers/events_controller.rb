class EventsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  # 登録済みイベント全件表示（ユーザも見れる）
  def index
    @events = Event.page(params[:page]).per(10)
  end

  # 登録済みイベント検索機能
  def search
    @results = @q.result
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
      redirect_to events_path
    else
      render new_event_path
    end
  end

  # ユーザ毎の登録済みイベント詳細画面
  def show
    @event = Event.find(params[:id])
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
      redirect_to edit_event_path(@event.id)
    end
  end

  # イベント削除機能
  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to events_path
  end

  # イベントカレンダー表示機能
  def scheduler
    @events = Event.all
  end

  private

  # Viewから送られてくる情報をransackを使用して加工 >> イベントレコード生成 >> @qに格納
  def set_q
    @q = Event.ransack(params[:q])
  end

  # ここで指定した項目のみweb経由での変更を許可にする
  def event_params
    params.require(:event).permit(
      :title,
      :introduction,
      :start_time,
      :end_time,
      :entry_count,
      :event_price,
      :address,
      :event_icon,
      :latitude,
      :longitude
    )
  end
end
