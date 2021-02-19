class StopwatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stopwatch, only: %i[destroy]

  def index
    @stopwatch = current_user.stopwatches.build
    @stopwatches = current_user.stopwatches.all
  end

  def new
    @stopwatch = current_user.stopwatches.build
  end

  def create
    @stopwatch = current_user.stopwatches.build(stopwatch_params)

    if @stopwatch.save
      redirect_to stopwatches_path
    else
      render :index
    end
  end

  def destroy
    @stopwatch.destroy
    redirect_to stopwatches_path
  end

  private

  def set_stopwatch
    @stopwatch = current_user.stopwatches.find(params[:id])
  end

  def stopwatch_params
    params.require(:stopwatch).permit(:time)
  end
end
