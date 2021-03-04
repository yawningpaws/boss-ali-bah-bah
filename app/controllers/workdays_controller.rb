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
    @default_check_in = Time.parse(now)
    @default_check_out = Time.parse(now_plus_9h)
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
    params.require(:workday).permit(:date, :check_in_time, :check_out_time, :on_rest, :on_mc)
  end

  def update_datetime(workday_params)
    attributes = {}
    attributes[:date] = workday_params[:date]
    check_in_datetime = "#{workday_params[:date]}T#{workday_params['check_in_time(4i)']}:#{workday_params['check_in_time(5i)']}"
    attributes[:check_in_time] = DateTime.strptime(check_in_datetime, "%Y-%m-%dT%H:%M")
    check_out_datetime = "#{workday_params[:date]}T#{workday_params['check_out_time(4i)']}:#{workday_params['check_out_time(5i)']}"
    attributes[:check_out_time] = DateTime.strptime(check_out_datetime, "%Y-%m-%dT%H:%M")
    attributes
  end
end
