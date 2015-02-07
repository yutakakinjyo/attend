class CreateCourseDetails < ActiveRecord::Migration
  def change
    create_table :course_details do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
