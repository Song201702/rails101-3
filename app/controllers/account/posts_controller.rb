class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.group= @group
    @post.user = current_user

  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.group =@group
    @post.user = current_user
    if @post.update(post_params)
      redirect_to posts_account_path, notice: "编辑成功！"
    else
      render :edit
    end
  end

    def delete
      @group = Group.find([:group_id])
      @post = Post.find(params[:id])
      @post.group = @group
      @post.user = current_user

      @post.destroy
        rediret_to posts_account_path, warning: "删除成功！"
    end

end
