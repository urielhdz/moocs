class Publication < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_student }
	attr_accessible :body, :student_id, :course_id
  belongs_to :student
  belongs_to :course
end
