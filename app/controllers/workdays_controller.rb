class WorkdaysController < ApplicationController
  def new
    @workday = Workday.new
  end

  def create
    @workday = Workday.new(workday_params)
    @workday.user = current_user
    if @workday.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @workday = Workday.find(params[:id])
  end

  def update
    @workday = Workday.find(params[:id])
    if @workday.update(workday_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def not_working
    @workday = Workday.new
  end

  private

  def workday_params
    params.require(:workday).permit(:date, :check_in_time, :check_out_time)
  end
end
