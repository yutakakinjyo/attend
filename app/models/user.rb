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

  def attend?(my_course_id, date=Date.current)
    Attendance.find_attend(my_course_id, self.id, date).present?
  end
  
  def get_attend(my_course_id, date=Date.current)
    attendance = Attendance.find_attend(my_course_id, self.id, date)
    if attendance.present?
      attendance
    else
      Attendance.new
    end
  end  

end
