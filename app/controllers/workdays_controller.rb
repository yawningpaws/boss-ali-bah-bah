class WorkdaysController < ApplicationController
  def new
    @workday = Workday.new
    @workdays_dates = Workday.all.map do |day|
      day.date
    end
  end

  def create
    @workday = Workday.new(workday_params)
    @workday.user = current_user

    respond_to do |format|
      if @workday.save
        format.html { redirect_to root_path, notice: 'You successfully checked in today!' }
        format.json { render :new }
      else
        format.html { render :new }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
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

  def on_leave
    @workday = Workday.new
  end

  private

  def workday_params
    params.require(:workday).permit(:date, :check_in_time, :check_out_time)
  end
end
