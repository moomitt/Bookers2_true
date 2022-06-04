class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @idbook = Book.find(params[:id])
  end

  def edit
    @idbook = Book.find(params[:id])
  end
  
  def update
    @idbook = Book.find(params[:id])
    @idbook.update(book_params)
    redirect_to book_path(@idbook.id)
  end
  
  def destroy
    @idbook = Book.find(params[:id])
    @idbook.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
