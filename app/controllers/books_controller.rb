class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    book = Book.new(book_params)
    if book.save
    redirect_to book_path(book.id)
    else
    render action: :index
    end
    flash[:notice] = "Book was successfully created."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(book.id)
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
