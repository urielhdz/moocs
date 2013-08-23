class CreateMyCourses < ActiveRecord::Migration
  def change
    create_table :my_courses do |t|
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
