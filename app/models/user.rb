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
    self.courses.find_by(id: course_id).present?
  end

  def attend?(course_id, date=Date.current)
    attendances.find_by(course_id: course_id, user_id: self.id, date: date).present?
  end
  
  def get_attend(course_id, date=Date.current)
    attendance = attendances.find_by(course_id: course_id, user_id: self.id, date: date)
    if attendance.present?
      attendance
    else
      Attendance.new
    end
  end  

end
