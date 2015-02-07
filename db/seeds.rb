student_role = Role.create(name: 'student')

('A'..'Z').each do |item|

  user = User.new
  user.name = "student#{item}"
  user.role_id = student_role.id
  user.email = "student#{item}@example.com"
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.save!

end

teacher_role = Role.create(name: 'teacher')

('1'..'10').each do |index|

  user = User.new
  user.name = "teacher#{index}"
  user.role_id = teacher_role.id
  user.email = "teacher#{index}@example.com"
  user.password = 'valid_password'
  user.password_confirmation = 'valid_password'
  user.save!

end

('1'..'5').each do |index|
  Course.create(name: "Course#{index}")
end

courses = Course.all.shuffle

courses.each do |course|
  students = User.where(role_id: student_role).shuffle
  (5..10).to_a.sample.times do
    CourseDetail.create(course_id: course.id, user_id: students.shift.id)
  end
end
