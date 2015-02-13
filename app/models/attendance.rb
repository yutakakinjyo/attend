class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  def self.find_attend(course_id, user_id, date)
    self.find_by(course_id: course_id, user_id: user_id, date: date)
  end

end
