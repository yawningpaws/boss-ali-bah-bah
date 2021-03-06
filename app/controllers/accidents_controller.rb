class AccidentsController < ApplicationController
  def new
    # check if current_user last accident is 10 mins ago
    if session[:accident].nil?
      @accident = Accident.new
    else
      @accident = Accident.find(session[:accident])
    end
  end

  def create
    @accident = Accident.new(accident_params)
    @accident.user = current_user
    if @accident.save
      session[:accident] = @accident.id
      redirect_to edit_accident_path(@accident)
    else
      render :new
    end
  end

  def edit
    @accident = Accident.find(params[:id])
  end

  def update
    @accident = Accident.find(params[:id])
    if @accident.update!(accident_params)
      if accident_params[:date]
        redirect_to edit_accident_path(@accident)
      elsif accident_params[:injured_part]
        redirect_to new3_accident_path(@accident)
      else
        session[:accident] = nil
        redirect_to complete_accident_path(@accident)
      end
    else
      render :edit
    end
  end

  def new3
    @accident = Accident.find(params[:id])
  end

  def complete
    @accident = Accident.find(params[:id])
  end

  def send_accident
    binding.pry
    @user = current_user
    @accident = Accident.find(email_params[:accident_id].to_i)
    @recipient = email_params[:email]
    if email_params[:email].match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      UserMailer.with(user: @user, accident: @accident, recipient: @recipient).send_accident.deliver_later
    else
      render :complete
    end
  end

  private

  def accident_params
    params.require(:accident).permit(:date, :time, :description, :injured_part, :medical_facility, :paid_by_employer, :mc_days, photos: [])
  end

  def email_params
    params.permit(:email, :accident_id)
  end
end
