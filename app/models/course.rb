class Course < ActiveRecord::Base
  has_many :users, through: :course_details
  has_many :course_details
  has_many :attendances

  def current_days
    (1..Time.now.end_of_month.day)
  end

  def current_month_dates
    (Time.now.change(day: 1)..Time.now.end_of_month.day)
  end

end
