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
    Attendance.find_by(course_id: my_course_id, user_id: self.id, date: Date.current).present?
  end

  def attend_by_date?(my_course_id, date)
    Attendance.find_by(course_id: my_course_id, user_id: self.id, date: date).present?
  end
  
  def get_attend(my_course_id)
    attendance = Attendance.find_by(course_id: my_course_id, user_id: self.id, date: Date.current)
    if attendance.present?
      attendance
    else
      Attendance.new
    end
  end
end
