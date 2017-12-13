class OwnerProfilesController < ApplicationController
  def index
    @owner_profiles = OwnerProfile.all
  end

  def show
    # @request = Request.new
    @owner_profile = OwnerProfile.find(params[:id])
  end

  def new
    @owner_profile = OwnerProfile.new
  end

  def create
    @owner_profile = OwnerProfile.new(owner_params)
    @owner_profile.user = current_user
    # raise
    @owner_profile.save
    redirect_to owner_profile_path(@owner_profile)
  end

  def edit
    @owner_profile = OwnerProfile.find(params[:id])
  end

  def update
    @owner_profile = OwnerProfile.find(params[:id])
    @owner_profile.update(owner_params)
    @owner_profile.save
    redirect_to owner_profiles_path(@owner_profile)
  end

  private

    def owner_params
      params.require(:owner_profile).permit(:verification_status)
    end

    def set_owner_profile
        @owner_profile = OwnerProfile.find(params[:id])
    end
end
