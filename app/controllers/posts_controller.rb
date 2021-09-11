class PostsController < ApplicationController

  #投稿済みコメント全件表示
  def index
    @entry = Entry.find(params[:entry_id])
    @posts = Post.where(user_id: current_user.id, entry_id: @entry.id)
  end
end
