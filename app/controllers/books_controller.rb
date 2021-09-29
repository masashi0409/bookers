class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(new_book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:error] = @book.errors.full_messages.count
      msg = @book.errors.full_messages.join(',')
      flash[:danger] = msg.gsub(",","<br>")
      redirect_to books_path
    end
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def new_book_params
    params.permit(:title, :body)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
