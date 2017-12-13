class WorkerProfilesController < ApplicationController
  def index
    @worker_profiles = WorkerProfile.all
  end

  def show
    # @request = Request.new
    @worker_profile = WorkerProfile.find(params[:id])
  end

  def new
    @worker_profile = WorkerProfile.new
  end

  def create
    @worker_profile = WorkerProfile.new(worker_params)
    @worker_profile.user = current_user
    # raise
    @worker_profile.save
    redirect_to worker_profile_path(@worker_profile)
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

    def set_worker_profile
        @worker_profile = WorkerProfile.find(params[:id])
    end
end
