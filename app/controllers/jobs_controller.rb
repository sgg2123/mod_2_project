class JobsController < ApplicationController
    before_action :get_job, only: [:show, :edit, :update, :destroy]

    # def index
    # end
    #
    # def new
    #   @job = Job.new
    #   @languages = Language.all
    # end
    #
    # def create
    #   @job = Job.create(job_params)
    #   redirect_to @job
    # end

    def search
      @job = Job.new
    end

    def results
      language = Language.find(job_params["language_id"]).lang_name
      @job_results = Job.job_search(language)
    end


    def edit
    end

    def update
    end

    def destroy
    end

    private

    def get_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :company_name, :description, :redirect_url, :listing_id, :language_id)
    end

end
