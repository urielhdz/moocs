class AddCourseIndexToPublication < ActiveRecord::Migration
  def change
  	add_column :publications, :course_id, :integer, index: true
  end
end
