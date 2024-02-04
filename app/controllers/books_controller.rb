class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:create, :edit, :update, :show, :index]
  before_action :authenticate_user!, only: [:create, :edit, :update, :show, :index]

  def new
    @book = Book.new
  end

  def create
    puts params.inspect
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @users = User.all
      @books = Book.all
      @user = current_user
      render 'books/index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end


  private

def book_params
  params.require(:book).permit(:title, :body, :user_id)
end

end
