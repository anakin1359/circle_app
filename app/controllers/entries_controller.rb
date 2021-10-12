class EntriesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @entries = Entry.page(params[:page]).where(user_id: current_user.id).per(10)
  end

  def search
    @result = @q.result
  end

  def new
    @event = Event.find(params[:event_id])
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build(entry_params)
    @event = Event.find(params[:event_id])
    @entry.event_id = @event.id
    if @entry.save
      flash[:notice] = "イベント予約が完了しました"
      redirect_to user_entries_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @event = Event.find(@entry.event_id)
    @posts = Post.page(params[:page]).where(entry_id: @entry.id).per(10)
    @post = Post.new
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:notice] = "予約を取り消しました"
    redirect_to user_entries_path(current_user.id)
  end

  private

  def set_q
    @q = Entry.where(user_id: current_user.id).ransack(params[:q])
  end

  def entry_params
    params.require(:entry).permit(
      :entry_name, :entry_count, :entry_price
    )
  end
end
