class LikesController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    like = current_user.likes.build(blog_id: params[:blog_id])
    like.save
    # redirect_to blogs_path
  end
  
  def destroy
    @blog = Blog.find(params[:blog_id])
    like = Like.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    like.destroy
    # redirect_to blogs_path
  end
  
end
