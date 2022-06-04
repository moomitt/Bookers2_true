class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
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
    if @idbook.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@idbook.id)
    else
      render :edit
    end
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
