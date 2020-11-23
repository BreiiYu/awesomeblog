class MicropostsController < ApplicationController
    before_action :only_loggedin_users, only: [:create, :destroy]

    def create 
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            redirect_to root_url
        else
            @feed_items = []
            render root_url
        end
    end

    def destroy
            Micropost.find(params[:id]).destroy
            redirect_to root_url
    end

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

    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end

    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
    end
end