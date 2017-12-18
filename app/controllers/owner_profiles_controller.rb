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
    current_user.update(user_params)
    @owner_profile.save!
    if @owner_profile.save
      redirect_to dashboard_owners_path
    end
    # end
  end

  def edit
    set_owner_profile
  end

  def update
    set_owner_profile
    if current_user.update(owner_params[:user])
      redirect_to owner_profile_path(current_user.owner_profile)
    else
      render :new
    end
  end

  private

    def owner_params
      params.require(:owner_profile).permit(:verification_status, user: [:photo, :photo_cache, :first_name, :last_name, :location])
    end

    def user_params
       params.require(:user).permit(:photo, :photo_cache, :first_name, :last_name, :location)
    end

    def set_owner_profile
        @owner_profile = OwnerProfile.find(params[:id])
    end
end
