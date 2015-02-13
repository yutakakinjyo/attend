class Course < ActiveRecord::Base
  has_many :users, through: :course_details
  has_many :course_details
  has_many :attendances

  def current_month_dates
    (Date.current.change(day: 1)..Date.current.end_of_month)
  end

end
