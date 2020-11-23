class LikesController < ApplicationController
    def uplike
        @micropost = Micropost.find(params[:id])
        @micropost.likes.create
        redirect_to current_user

        #redirect_back(fallback_location: root_path)
    end

    def dislike
        @micropost = Micropost.find(params[:id])
        @micropost.likes.first.destroy
        redirect_to current_user
    end
end
