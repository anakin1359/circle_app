class PostsController < ApplicationController

  # 投稿済みコメント全件表示
  def index
    @entry = Entry.find(params[:entry_id])
    @posts = Post.where(user_id: current_user.id, entry_id: @entry.id)
  end

  # コメント投稿機能（失敗したら現ページへ残留）
  # Postのcreateアクション
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to user_entry_path(user_id: current_user.id, entrry_id: @entry.id)
    else
      @feed_items = []
      redirect_to user_entry_path(user_id: current_user.id, entrry_id: @entry.id)
    end
  end

  private

    def post_params
      params.require(:post).permit(
        :subject, :comment
      )
    end
end
