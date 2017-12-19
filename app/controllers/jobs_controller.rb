
class JobsController < ApplicationController

    def index
    if params["category"]
      @jobs_search = PgSearch.multisearch(params["category"].capitalize)
    else
      @jobs = Job.all
    end
  end

  def show
    @request = Request.new
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.user = current_user
    # @owner_profile.user = current_user
    @owner_profile = OwnerProfile.where(user_id: current_user.id).last
    @job.owner_profile = @owner_profile
    # raise
    @job.save
    redirect_to worker_profiles_path(category: job_params[:category])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    @job.save
    redirect_to owner_profile_jobs(@job)
  end

  private

  def job_params
      params.require(:job).permit(:title, :description, :category, photos: [])
    end

  def set_job
    @job = Job.find(params[:id])
  end


end
