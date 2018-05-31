class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:edit]

  def welcome

  end

  def new
    @user = User.new
    @languages = Language.all
  end

  def create

    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to login_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show

  end

  def edit
    if current_user != @user
      redirect_to current_user
    end
    @languages = Language.all
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to welcome_path
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, language_ids: [], company_ids: [])
  end

end
