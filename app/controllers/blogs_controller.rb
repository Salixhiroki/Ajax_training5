class BlogsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.save
    redirect_to blogs_path
  end
  
  def index
    @blogs = Blog.all
    # binding pry
  end
  
  
  def show
    @blog = Blog.find(params[:id])
    @user = @blog.user
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
  
  
end
