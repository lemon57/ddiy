class Dashboard::DashboardsController < ApplicationController
  def worker

    # @job = Job.last
    @user = current_user
    # @jb_id = @user.worker_profile.user_id
    @worker_profile = WorkerProfile.find("#{@user.worker_profile.id}")
    # @request = Request.all.where(worker_profile_id: @worker_profile.id)[0]
    @request = Request.find("#{@worker_profile.id}")
    # @job = Job.all.where(id: @request.job_id)
    @job = Job.find("#{@request.job_id}")

    # raise
  end

  def owner
  end
end
