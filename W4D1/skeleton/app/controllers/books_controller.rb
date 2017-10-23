class BooksController < ApplicationController
  def index
    # your code here
    render json: Book.all
    # @books = Book.all
    # render :index
  end

  def new
    render :new
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      flash.new[:errors] = book.errors.full_messages
      render :new
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    render json: book
    # redirect_to index books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
