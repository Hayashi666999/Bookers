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
    books = Book.find(params[:id])
    books.update(books_params)
    redirect_to books_path(books.id)  
  end
  
  def destroy
    books = Book.find(params[:id])
    boo.destroy 
    redirect_to '/books'
  end
  
  def create
    @books = Book.new(books_params)
    if @books.save
      redirect_to @books, flash: { notice: '記事の作成が作成されました。' }
    else
      redirect_to new_books_@path
    end
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end