class PagesController < ApplicationController
  def home
  end

  def calendar
    @workdays = Workday.where(user: current_user)
    @payslips = Payslip.where(user: current_user)
  end
end
