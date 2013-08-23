class Friendship < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_student }
	attr_accessible :student_id, :friend_id
  belongs_to :friend, class_name: 'Student'
  belongs_to :student
end
