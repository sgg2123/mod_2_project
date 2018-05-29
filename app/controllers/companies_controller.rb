class CompaniesController < ApplicationController
    before_action :get_company, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
      @company = Company.new
      @languages = Language.all
    end

    def create
      @company = Company.create(company_params)
      redirect_to @company
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

    def get_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, language_ids: [])
    end

end
