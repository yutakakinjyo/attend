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

# students = User.where(:role_id student_role).shuffle.to_a
('1'..'5').each do 
  # Course.create(user_id: students.sample, name:)
end
