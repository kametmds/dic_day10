class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
      flash[:notice] = "作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @blog = Blog.update(blog_params)
    if @blog.update
      redirect_to blogs_path
      flash[:notice] = "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
    flash[:notice] = "削除しました"
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
