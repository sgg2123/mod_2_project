class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def welcome

  end

  def new
    @user = User.new
    @languages = Language.all
  end

  def create

    @user = User.create(user_params)
    if @user.valid?
    redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, language_ids: [], company_ids: [])
  end
end
