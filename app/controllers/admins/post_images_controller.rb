class Admins::PostImagesController < ApplicationController
 before_action :authenticate_admin!
 def index
     @post_images = PostImage.all
 end
    
 def new
     @post_image = PostImage.new
 end
 
 def create
     @post_image = PostImage.new(post_image_params)
     @post_image.admin_id = current_admin.id
     # @post_image.event_id = current_admin.id
     @post_image.save
     redirect_to admins_post_images_path
 end
 
 def destroy
  @post_image = PostImage.find(params[:id])
  @post_image.destroy
  redirect_to admins_post_images_path
 end
 
 private
 def post_image_params
     params.require(:post_image).permit(:admin_id, :event_id, :user_id, :image_id, :introduction, :name, :image)
 end
end

