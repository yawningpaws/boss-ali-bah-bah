class PagesController < ApplicationController
  def home
    if !user_signed_in?
      redirect_to landing_path
    else
      @workday_checkedin = Workday.where("user_id = ? and date = ? and start_time is not null", current_user.id,Date.today)[0]
    end
  end

  def calendar
    @workdays = Workday.where(user: current_user)
    @payslips = Payslip.where(user: current_user)
    @basic_salary = current_user.basic_salary
  end

  def files
    @payslips = Payslip.where(user: current_user).order("year DESC", "month ASC")
    @accidents = Accident.where(user: current_user).sort_by(&:date).reverse
    @user = current_user
    @workdays = Workday.where(user: current_user).group_by { |m| m.date.beginning_of_month }
  end
end
