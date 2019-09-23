class BooksController < ApplicationController
  before_action :authenticate_user!
  def show
      @bookd = Book.find(params[:id])
      @user = @bookd.user
      @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if current_user == @book.user
    else
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.user_id = current_user.id
    if book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(book.id)
    else
      @book = book
      render :edit
    end
  end

  def index
    @book = Book.new
    @bookall = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have creatad book successfully."
       redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = @user.books
      @bookall = Book.all
      render :index
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end




  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

Refile.secret_key = '84a195ac00c372f5f7f83073a1b39630c9c5aa27ea958b0a33f8779088c0215fcaa0caf8a0d8f69d472f61f997e02dfa83e922e5b1b447c6a84042245dd5e0f2'
