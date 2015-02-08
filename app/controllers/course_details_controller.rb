class CourseDetailsController < ApplicationController

  def create
    course_detail = CourseDetail.new(course_details_paramas)
    course_detail.save
    redirect_to course_detail.course
  end

  def destroy
    course_detail = CourseDetail.find(params[:id])
    course = course_detail.course
    course_detail.destroy
    redirect_to course
  end

  private 
  def course_details_paramas
    params.require(:course_detail).permit(:user_id, :course_id)
  end

end
