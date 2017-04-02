class PostsController < ApplicationController

  before_filter :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy ]

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
    @articles_by_date_on = @posts.group_by(&:published_on)
    @articles_by_date_end = @posts.group_by(&:published_end)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :published_on, :published_end, :body, :povtor)
  end

end