class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = Request.new(requests_params)
    if @request.save!
      flash[:notice] = "All good"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  private

  def requests_params
    params.require(:request).permit(:status, :hours, :start_time, :material_cost, :time, :job_id, :worker_profile_id)
  end




end
