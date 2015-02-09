class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])

    if current_user.join?(@course.id)
      @course_detail = CourseDetail.find_by(course_id: @course.id, user_id: current_user.id)
    else
      @course_detail = CourseDetail.new 
    end

    @current_month = Time.now.strftime("%Y-%m")

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render action: 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private
  
  def course_params
    params.require(:course).permit(:name)
  end

end
