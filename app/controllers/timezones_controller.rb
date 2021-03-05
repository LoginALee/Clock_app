class TimezonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timezone, only: %i[destroy]

  def index
    @current_time_zone = current_user.time_zone
    @time_zones = current_user.timezones
  end

  def new
    @time_zone = current_user.timezones.build
  end

  def create
    @time_zone = current_user.timezones.build(time_zone_params)
    if @time_zone.save
      redirect_to timezones_path
    else
      render :new
    end
  end

  def destroy
    @time_zone.destroy
    redirect_to timezones_path
  end

  private

  def set_timezone
    @time_zone = Timezone.find(params[:id])
  end

  def time_zone_params
    params.require(:timezone).permit(:name)
  end
end
