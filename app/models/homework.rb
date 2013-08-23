class Homework < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_student }
  belongs_to :course
  attr_accessible :course_id, :titulo, :descripcion, :entrega
end
