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
    @request.save
  end

  private

  def requests_params
    params.require(:request).permit(:status, :hours, :start_time, :material_cost, :time)
  end




end
