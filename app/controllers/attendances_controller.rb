class AttendancesController < ApplicationController
      
  def create
    attendance = Attendance.new(attendance_params)
    attendance.date = Time.now
    attendance.save
    redirect_to :back
  end

  def destroy
    attendance = Attendance.find(params[:id])
    attendance.destroy
    redirect_to :back
  end

  private

  def attendance_params
    params.require(:attendance).permit(:course_id, :user_id, :date)
  end
end
