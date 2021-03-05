class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit_time_zone]

  def edit_time_zone; end

  def update_time_zone
    current_user.update(user_params)
    redirect_to timezones_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:time_zone)
  end
end
