class UsersController < ApplicationController
  def user_params
  params.require(:user).permit(:frist_name, :last_name, :location, :photo, :photo_cache)
end
end
