class PayslipsController < ApplicationController
  def new
    @payslip = Payslip.new
  end

  def create
    @payslip = Payslip.new(payslip_params)
    @payslip.user = current_user

    respond_to do |format|
      if @payslip.save
        start_date = "#{payslip_params[:year]}-#{payslip_params[:month]}-01"
        format.html { redirect_to calendar_path(start_date: start_date), notice: 'You successfully logged your salary!' }
        format.json { render :new }
      else
        format.html { render :new, alert: 'Please fix errors!' }
        format.json { render json: @payslip.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @payslip = Payslip.find(params[:id])
  end

  def update
    @payslip = Payslip.find(params[:id])
    respond_to do |format|
      if @payslip.update(payslip_params)
        start_date = "#{payslip_params[:year]}-#{payslip_params[:month]}-01"
        format.html { redirect_to calendar_path(start_date: start_date), notice: 'You successfully logged your salary!' }
        format.json { render :new }
      else
        format.html { render :new, alert: 'Please fix errors!' }
        format.json { render json: @payslip.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_payslip
    @user = current_user
    @email = params.permit(:email)[:email]
    binding.pry
    @payslip = Payslip.find(params.permit(:payslip_id)[:payslip_id])
    if @email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
      UserMailer.with(user: @user, payslip: @payslip, email: @email).send_payslip.deliver_now
    else
      flash.alert = "That is not an appropriate email"
    end
  end

  private

  def payslip_params
    params.require(:payslip).permit(:month, :year, :amount, :payment_method, photos: [])
  end
end
