class AttendancesController < ApplicationController

  def create
    attendance = Attendance.new(attendance_params)
    attendance.save
    redirect_to attendance.course
  end

  private

  def attendance_params
    params.require(:attendance).permit(:course_id, :user_id, :date)
  end
  

end
