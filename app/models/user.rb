class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses, through: :course_details
  has_many :course_details
  has_many :attendances
  belongs_to :role

  def join?(course_id)
    self.courses.each do |course|
      return true if course.id == course_id
    end
    false
  end

  def attend?(my_course_id)
    attendances = Attendance.where(course_id: my_course_id, user_id: self.id)
    return false if attendances.nil?
    attendances.each do |attendance|
      return true if attendance.date == Date.current
    end
    false
  end

  def attend_by_date?(my_course_id, date)
    attendance = Attendance.where(course_id: my_course_id, user_id: self.id)
    return false if attendance.nil?
    attendances.each do |attendance|
      return true if attendance.date == date
    end
    false
  end
  
  def get_attend(my_course_id)
    attendances = Attendance.where(course_id: my_course_id, user_id: self.id)
    return Attendance.new if attendances.nil?
    attendances.each do |attendance|
      return attendance if attendance.date.day == Time.now.day 
    end
    Attendance.new 
  end
end
