class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit_time_zone]

  def edit_time_zone; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path, notice: 'Profile was successfully updated.')
    else
      redirect_back(fallback_location: root_path, alert: 'Profile could not be updated.')
    end
  end

  def update_time_zone
    current_user.update(user_params)
    redirect_to timezones_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:time_zone, :avatar)
  end
end
