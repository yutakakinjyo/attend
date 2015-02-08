class AttendancesController < ApplicationController
      
  def create
    attendance = Attendance.new(attendance_params)
    attendance.date = Time.now
    attendance.save
    redirect_to home_index_url
  end

  private

  def attendance_params
    params.require(:attendance).permit(:course_id, :user_id, :date)
  end
  

end
