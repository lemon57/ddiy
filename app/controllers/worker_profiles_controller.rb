class WorkerProfilesController < ApplicationController
  def index
    if params["category"]
      @worker_profiles = WorkerProfile.where(skill_area: params["category"].capitalize)
    else
      @worker_profiles = WorkerProfile.all
    end
    @job = Job.find_by_owner_profile_id(current_user.owner_profile.id)

  end

  def show
    # @request = Request.new
    @worker_profile = WorkerProfile.find(params[:id])
    @job_id = Job.all.last.id
    @request = Request.new
  end

  def new
    @worker_profile = WorkerProfile.new
    @user = current_user
  end

  def create
    @worker_profile = WorkerProfile.new(worker_params)
    @worker_profile.user = current_user
    current_user.update(user_params)
    @worker_profile.save!
    if @worker_profile.save
      redirect_to dashboard_workers_path
    end
  end

  def edit
    @worker_profile = WorkerProfile.find(params[:id])
  end

  def update
    @worker_profile = WorkerProfile.find(params[:id])
    @worker_profile.update(worker_params)
    @worker_profile.save
    redirect_to worker_profiles_path(@worker_profile)
  end

  private

    def worker_params
      params.require(:worker_profile).permit(:verification_status, :skill_area, :price_per_hour, :bio, :available, :timetable)
    end

    def user_params
       params.require(:user).permit(:photo, :photo_cache, :first_name, :last_name, :location)
    end

    def set_worker_profile
        @worker_profile = WorkerProfile.find(params[:id])
    end
end
