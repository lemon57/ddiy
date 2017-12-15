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
    @user = current_user
  end

  def create
    @owner_profile = OwnerProfile.new(user: current_user)
    # @owner_profile.user = current_user


#     @owner_profile.save
#     redirect_to dashboard_owners_path
# =======

    current_user.update(user_params)
    @owner_profile.save!
    if @owner_profile.save
      redirect_to dashboard_owners_path
    end

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

    def user_params
       params.require(:user).permit(:photo, :photo_cache, :first_name, :last_name, :location)
    end

    def set_owner_profile
        @owner_profile = OwnerProfile.find(params[:id])
    end
end
