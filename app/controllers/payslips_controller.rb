class PayslipsController < ApplicationController
  def new
    @payslip = Payslip.new
  end

  def create
    @payslip = Payslip.new(payslip_params)
    @payslip.user = current_user

    respond_to do |format|
      if @payslip.save
        format.html { redirect_to root_path, notice: 'You successfully logged your salary!' }
        format.json { render :new }
      else
        format.html { render :new, alert: 'Please fix errors!' }
        format.json { render json: @payslip.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def payslip_params
    params.require(:payslip).permit(:month, :year, :amount, :payment_method)
  end
end
