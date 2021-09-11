class PostsController < ApplicationController

  #投稿済みコメント全件表示
  def index
    # @posts = Post.all
    # @posts = Post.where(user_id: current_user.id)

    @entries = Entry.find(params[:id])
    @posts = Post.where(user_id: current_user.id, entry_id: @entries.id)
  end
end
