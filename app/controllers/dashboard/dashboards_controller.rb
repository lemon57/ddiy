class Dashboard::DashboardsController < ApplicationController
  def worker

    # @job = Job.last
    @user = current_user

    # @jb_id = @user.worker_profile.user_id


    @worker_profile = WorkerProfile.find("#{@user.worker_profile.id}")
    # @request = Request.all.where(worker_profile_id: @worker_profile.id)[0]
    if params["status"] == "accepted"
        @requests = Request.where(worker_profile_id: @worker_profile.id, status: "accepted")
    elsif params["status"] == "completed"
        @requests = Request.where(worker_profile_id: @worker_profile.id, status: "completed")
    elsif params["status"] == "expired"
        @requests = Request.where(worker_profile_id: @worker_profile.id, status: "expired")
    elsif params["status"] == "all"
      @requests = Request.where(worker_profile_id: @worker_profile.id)
    else
      @requests = Request.where(worker_profile_id: @worker_profile.id, status: "pending")
    end


    if @request.nil?
    else
      @request = Request.find(worker_profile_id = "#{@worker_profile.id}")
    # @job = Job.all.where(id: @request.job_id)
      @job = Job.find("#{@request.job_id}")
    end

    # raise
  end

  def owner
    @user = current_user
    @owner_profile = OwnerProfile.find_by(user_id: @user.id)
    # @owner_profile = OwnerProfile.find("#{@user.owner_profile.id}")
    # @request = Request.all.where(owner_profile_id: @owner_profile.id)[0]
    # use it insteadof Requests.joins(:job).where(job: {owner_profile_id: @owner_profile.id, status: ...})

    if params["status"] == "recieved quote"
      @jobs = Job.where(owner_profile_id: @owner_profile.id, status: "recieved quote")
    elsif params["status"] == "accepted"
      @jobs = Job.where(owner_profile_id: @owner_profile.id, status: "accepted")
    elsif params["status"] == "completed"
      @jobs = Job.where(owner_profile_id: @owner_profile.id, status: "completed")
    elsif params["status"] == "declined"
      @jobs = Job.where(owner_profile_id: @owner_profile.id, status: "declined")
    elsif params["status"] == "all"
      @jobs = Job.where(owner_profile_id: @owner_profile.id)
    else
      @jobs = Job.where(owner_profile_id: @owner_profile.id, status: "pending")
    end

    if @request.nil?
    else
      # @request = Request.find(owner_profile_id = "#{@owner_profile.id}")
    # @job = Job.all.where(id: @request.job_id)
      @job = Job.find("#{@request.job_id}")
    end

  end
end

