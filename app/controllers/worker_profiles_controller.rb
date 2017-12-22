class WorkerProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :show, :create, :store_worker_id]
  def index
    if params["category"]
      @worker_profiles = WorkerProfile.where(skill_area: params["category"])
    else
      @worker_profiles = WorkerProfile.all
    end
    if !current_user.nil?
      @job = Job.find_by_owner_profile_id(current_user.owner_profile.id)
    end
    if params["status"] == "all_pro"
      @worker_profiles = WorkerProfile.all
    end
  end

  def show
    # @request = Request.new
    @worker_profile = current_user.worker_profile || WorkerProfile.find(params[:id])
    @request = Request.new
    if params[:job_id]
      @job = Job.find(params[:job_id])
    end
  end

  def new
    @worker_profile = WorkerProfile.new
    @user = current_user
  end

  def store_worker_id
    if current_user.blank?
    cookies[:worker_id] = params["worker_profile_id"]
    redirect_to new_user_registration_path
    else
      # job_id: current_user. jobs
      @request = Request.new(job_id: params[:job_id], worker_profile_id: params[:worker_profile_id])
      if @request.save!
        flash[:notice] = "All good"
        redirect_to owner_profiles_path
      else
        flash[:alert] = "Something went wrong"
        render :new
      end
      redirect_to dashboard_owners_path
    end
  end

  def create
    @worker_profile = WorkerProfile.new(worker_params)
    @worker_profile.user = current_user
    current_user.update(user_params)
    if @worker_profile.save
      redirect_to dashboard_workers_path
    else
      render :new
    end
  end

  def edit
    set_worker_profile
  end

  def update
    set_worker_profile
    if current_user.worker_profile.update(worker_params) && current_user.update(user_params)
        redirect_to worker_profile_path(current_user)
    else
      render :new
    end
  end

  private

    def worker_params
      params.require(:worker_profile).permit(:verification_status, :skill_area, :price_per_hour, :bio, :available, :timetable, user: [:photo, :photo_cache, :first_name, :last_name, :location])
    end

    def user_params
       params.require(:user).permit(:photo, :photo_cache, :first_name, :last_name, :location)
    end

    def set_worker_profile
        @worker_profile = WorkerProfile.find(params[:id])
    end
end
