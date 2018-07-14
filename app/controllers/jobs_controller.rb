class JobsController < ApplicationController
    before_action :get_job, only: [:show, :edit, :update, :destroy]

    def create
      if Job.find_by(listing_id: job_params[:listing_id], language_id: job_params[:language_id])
        @job = Job.find_by(listing_id: job_params[:listing_id], language_id: job_params[:language_id])
      else
        @job = Job.create(job_params)
      end
      current_user.jobs << @job
    end

    def search
      @languages = Language.all
    end

    def show
    end

    def results
      @language = URI.decode(params[:language])
      @pg_num = params[:page]
      @job_results = Job.job_search(@pg_num, @language)
      @count = Job.pg_count(@language)/10 + 1
      @mean = Job.mean(@language)
      @job = Job.new

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
      params.require(:job).permit(:title, :company_name, :description, :redirect_url, :listing_id, :language_id, :language)
    end

    def pages
      Job.job_search(language)
    end
end
