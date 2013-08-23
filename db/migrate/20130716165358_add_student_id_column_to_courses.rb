class AddStudentIdColumnToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :student, index: true
  end
end
