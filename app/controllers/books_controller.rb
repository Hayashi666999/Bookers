class BooksController < ApplicationController
  def new
  end

  def index
    @books = Books.all  
  end

   def show
    @books = Books.find(params[:id])  
  end

   def edit
    @books = Books.find(params[:id])
  end
  
  private
  def books_params
    params.require(:books).permit(:title, :body)
  end
end