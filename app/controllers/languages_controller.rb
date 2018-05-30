class LanguagesController < ApplicationController

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.create(language_params)
    redirect_to @language
  end

  def show
    @language = Language.find(params[:id])
    
  end



  private

  def language_params
    params.require(:language).permit(:lang_name, :history, :jobs_available, :average_salary, :description, :fields_of_application)
  end

end
