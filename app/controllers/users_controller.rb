class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create # button gets user pass name
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render 'new' #goes new page
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 12)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @users
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end
  
  def index
    @users = User.all
    @users = User.paginate(page: params[:page], per_page: 10 )
  end


  before_action :only_loggedin_users, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]

  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 5)
    @all_users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 5)
    @all_users = @user.followers
    render 'show_follow'
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])

    redirect_to(root_url)
    unless current_user?(@user)
    end
  end
end
