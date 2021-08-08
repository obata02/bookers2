class UsersController < ApplicationController

  def show
    @bookn = Book.new
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
     redirect_to  user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = 'You have updated user successfully.'
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @users = User.all
    @bookn = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
