class UsersController < ApplicationController
  def show
  	@user = Uesr.find(params[:id])
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end
end
