class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(books_params)
    redirect_to book_path(@books.id)
    flash[:notice] = "Book was successfully update."
    else
   render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to book_path(@book.id), flash: { notice: 'Book was successfully created.' }
    else
    @books = Book.all
      render :index
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end