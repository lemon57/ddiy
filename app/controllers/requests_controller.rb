class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def show
    @request = Request.find(params[:id])
    @job = Job.find(@request.job_id)
  end

  def create
    @request = Request.new(requests_params)
    @job = Job.find(params["request"]["job_id"])
    if @request.save!
      flash[:notice] = "Request sent to #{@request.worker_profile.user.full_name}"
      @worker_profiles = WorkerProfile.where(skill_area: params[:request][:category])

      if @worker_profiles.nil?
        @worker_profiles = WorkerProfile.all
      end
      redirect_to job_worker_profiles_path(@request.job, test: params[:request][:category])
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def edit
    @request = Request.find(params[:id])
    @job = Job.find(@request.job_id)
  end

  def update
    @request = Request.find(params[:id])
    @request.update(requests_params)
    if @request.status == "send quote"
      flash[:notice] = "Sent quote"
    else
     flash[:notice] = "request cancelled"
    end
    redirect_to dashboard_workers_path
  end

  def price

  end

  # monetize :price_cents

  private

  def requests_params
    params.require(:request).permit(:worker_profile_id, :job_id, :status, :hours, :start_time, :material_cost, :time )
  end




end
