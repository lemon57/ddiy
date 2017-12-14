class Dashboard::DashboardsController < ApplicationController
  def worker

    # @job = Job.last
    @user = current_user
    @jb_id = @user.worker_profile.user_id
    @worker_profile = WorkerProfile.find("#{@user.worker_profile.id}")
    @request = Request.where()
    @job = Job.where(id: "@user.worker_profile.user_id")

    raise
  end

  def owner
  end
end
