class PostsController < ApplicationController

  # 投稿済みコメント全件表示
  def index
    @entry = Entry.find(params[:entry_id])
    @posts = Post.where(user_id: current_user.id, entry_id: @entry.id)
  end

  # コメント投稿機能（失敗したら現ページへ残留）
  def create
    #
  end

  private

  def post_params
    params.require(:post).permit(
      :subject,
      :comment
    )
end
