class PostsController < ApplicationController
  def index
    @entry = Entry.find(params[:entry_id])
    @posts = Post.where(user_id: current_user.id, entry_id: @entry.id)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.entry_id = params[:entry_id]
    if @post.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to user_entry_path(user_id: current_user.id, id: @post.entry_id)
    else
      flash[:alert] = "件名、もしくは投稿内容を入力してください"
      redirect_to user_entry_path(user_id: current_user.id, id: @post.entry_id)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :subject, :comment
    )
  end
end
