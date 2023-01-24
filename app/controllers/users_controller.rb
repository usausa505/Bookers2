class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to user_path
    end
  end

end
