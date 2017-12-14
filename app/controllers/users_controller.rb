class UsersController < ApplicationController
  def edit
    @current_user = CurrentUser.find(params[:id])
  end

  def update
    @current_user = WorkerProfile.find(params[:id])
    @current_user.update(worker_params)
    @current_user.save
    redirect_to root_path(@current_user)
  end

  private

  def worker_params
      params.require(:current_user).permit(:photo)
    end

  def set_current_user
    @current_user = CurrentUser.find(params[:id])
  end
end
