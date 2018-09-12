class PostsController < ApplicationController
  before_action :require_login

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    # debugger
    @subs = Sub.all

    @post.author_id = current_user.id
    # @post.sub_ids = params[:post][:sub_ids]
    # @post.sub_id = params[:sub_id]
    # params[:post][:sub_ids].each do |subid|
    #   PostSub.create(post_id)
    # end

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @subs = Sub.all
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    sub_id = @post.sub_id
    @post.destroy
    redirect_to sub_url(sub_id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
