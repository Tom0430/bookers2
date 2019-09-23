class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

    def index
      @usera = User.all
      @book = Book.new
      @user = current_user
    end
    def show
      @book = Book.new
      @user = User.find(params[:id])
      @books= @user.books
    end

    def edit
      @user = User.find(params[:id])
      if current_user == @user
      else
        redirect_to user_path(current_user.id)
      end
    end

    def update
      user = User.find(params[:id])
      if user.update(user_params)
        flash[:notice] = 'You have updated user successfully.'
        redirect_to user_path
      else
        @user = user
        render :edit
      end
    end

    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

Refile.secret_key = '048b4f2e4226ce7507f70bfb07479d03d9b046487f5f42276aa9c082274433c1f8b81b643e807cd18ecad45c3f7fa23f59f15f0e211be0852e4ec12660067508'