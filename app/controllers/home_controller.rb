class HomeController < ApplicationController

  def index
    @courses = current_user.courses
    @attendance = Attendance.new
  end

end
