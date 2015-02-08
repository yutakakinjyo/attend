class Course < ActiveRecord::Base
  has_many :users, through: :course_details
  has_many :course_details
  has_many :attendances
end
