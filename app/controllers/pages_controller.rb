class PagesController < ApplicationController
  def home
  end

  def calendar
    @workdays = Workday.where(user: current_user)
    @payslips = Payslip.where(user: current_user)
    @basic_salary = current_user.basic_salary
  end
end
