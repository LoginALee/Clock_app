class AlarmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_alarm, only: %i[destroy edit update]

  def index
    @alarms = current_user.alarms
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @alarm = current_user.alarms.build
  end

  def edit; end

  def create
    @alarm = current_user.alarms.build(alarm_params)
    if @alarm.save
      UserMailer.with(user: current_user, alarm: @alarm).alarm_activated.deliver_later
      redirect_to alarms_path
    else
      render :new
    end
  end

  def update
    if @alarm.update(alarm_params)
      redirect_to alarms_path
    else
      render :edit
    end
  end

  def destroy
    @alarm.destroy
    redirect_to alarms_path
  end

  private

  def set_alarm
    @alarm = Alarm.find(params[:id])
  end

  def alarm_params
    params.require(:alarm).permit(:time, days: [])
  end
end
