class BooksController < ApplicationController
  def new
    @book = Book.new
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
