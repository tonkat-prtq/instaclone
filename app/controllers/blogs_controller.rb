class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.ne
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました"
    else
      render :new
    end
  end

  def edit
    @blog.image.cache! unless @blog.image.blank? # 既に画像が存在する場合キャッシュを作成する
  end

  def update
    if params[:back]
      render :edit
    else
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: 'ブログを編集しました'
      else
        render :edit
      end
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました'
  end
  
  private

  def blog_params
    params.require(:blog).permit(:id, :title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
