class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :edit, :update, :show, :index]
  before_action :authenticate_user!, only: [:create, :edit, :update, :show, :index]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def create
    super
    flash[:notice] = flash[:signed_up]
  end

  def create
    super
    flash[:notice] = flash[:signed_in]
  end


  private


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end