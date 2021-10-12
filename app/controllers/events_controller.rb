class EventsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @events = Event.page(params[:page]).per(10)
  end

  def search
    @results = @q.result
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "イベント登録が完了しました"
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    # binding.pry
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "イベントを更新しました"
      redirect_to events_path
    else
      flash[:alert] = "イベントの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to events_path
  end

  def scheduler
    @events = Event.all
  end

  private

  def set_q
    @q = Event.ransack(params[:q])
  end

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
