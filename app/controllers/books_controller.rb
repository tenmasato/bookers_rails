class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
      @books=Book.all
    render:index
    end
    flash[:notice] = "Book was successfully created."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id)
  else
    book=Book.all
    render:edit
  end
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
