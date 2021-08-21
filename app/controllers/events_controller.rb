class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "イベント登録が完了しました"
      redirect_to user_path(current_user.id)
      # redirect_to root_path
    else
      render new_event_path
    end
  end

  def edit
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
