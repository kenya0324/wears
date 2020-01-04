class PostImagesController < ApplicationController
    before_action :authenticate_user!, only: [:show, :create]
	def new
		 @post_image = PostImage.new
	end

	def create
		 @post_image = PostImage.new(post_image_params)
         @post_image.user_id = current_user.id
      if @post_image.save
         redirect_back(fallback_location: root_path)
     else
         redirect_back(fallback_location: root_path)
     end
	end

	def index
		@post_images = PostImage.all
	end

	def show
		@post_image = PostImage.find(params[:id])
        new_history = @post_image.browsing_histories.new
        new_history.user_id = current_user.id

     if current_user.browsing_histories.exists?(post_image_id: "#{params[:id]}")
        old_history = current_user.browsing_histories.find_by(post_image_id: "#{params[:id]}")
        old_history.destroy
     end

        new_history.save

        histories_stock_limit = 10
        histories = current_user.browsing_histories.all
     if histories.count > histories_stock_limit
        histories[0].destroy
     end
		@post_comment = PostComment.new
        @like = Like.new
	end

	def edit
		@post_image = PostImage.find(params[:id])
	end

	def update
		@post_image = PostImage.find(params[:id])
		@post_image.update(post_image_params)
        redirect_to post_image_path(@post_image)
    end

    def destroy
    	post_image = PostImage.find(params[:id])
        post_image.destroy
        redirect_to post_images_path
    end

    def search
        @user_or_post_image = params[:option]
     if @user_or_post_image == "1"
        @users = User.search(params[:search], @user_or_post_image)
    else
        @post_images = PostImage.search(params[:search], @user_or_post_image)
    end
    end


end
    private
    def post_image_params
        params.require(:post_image).permit(:item_name, :image, :user_name, :caption)
    end
