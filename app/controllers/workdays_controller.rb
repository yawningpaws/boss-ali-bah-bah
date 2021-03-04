class WorkdaysController < ApplicationController
  def index
    @workdays = Workday.where(user: current_user)
  end

  def new
    @workday = Workday.new
    @workdays_dates = Workday.all.map do |day|
      day.date
    end

    timestep = 5 * 60
    now = Time.at((Time.now.to_r / timestep).round * timestep).strftime("%H:%M")
    now_plus_9h = (Time.at((Time.now.to_r / timestep).round * timestep) + 9 * 60 * 60).strftime("%H:%M")
    @default_start_time = Time.parse(now)
    @default_end_time = Time.parse(now_plus_9h)
  end

  def create
    if workday_params[:on_rest].nil? && workday_params[:on_mc].nil?
      attributes = update_datetime(workday_params)
      @workday = Workday.new(attributes)
    else
      @workday = Workday.new(workday_params)
    end
    @workday.user = current_user
    respond_to do |format|
      if @workday.save
        format.html { redirect_to root_path, notice: 'You successfully checked in today!' }
        format.json { render :new }
      else
        format.html { render :new, alert: 'Please fix errors!' }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @workday = Workday.find(params[:id])
  end

  def update
    @workday = Workday.find(params[:id])
    if workday_params[:on_rest].nil? && workday_params[:on_mc].nil?
      attributes = update_datetime(workday_params)
    else
      attributes = workday_params
    end
    if @workday.update(attributes)
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
    params.require(:workday).permit(:date, :start_time, :end_time, :on_rest, :on_mc)
  end

  def update_datetime(workday_params)
    attributes = {}
    attributes[:date] = workday_params[:date]
    start_datetime = "#{workday_params[:date]}T#{workday_params['start_time(4i)']}:#{workday_params['start_time(5i)']}"
    attributes[:start_time] = DateTime.strptime(start_datetime, "%Y-%m-%dT%H:%M")
    end_datetime = "#{workday_params[:date]}T#{workday_params['end_time(4i)']}:#{workday_params['end_time(5i)']}"
    attributes[:end_time] = DateTime.strptime(end_datetime, "%Y-%m-%dT%H:%M")
    attributes
  end
end
