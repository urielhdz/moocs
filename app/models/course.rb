class Course < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_student }
	attr_accessible :descripcion, :dificultad, :titulo, :student_id
	has_many :my_courses, dependent: :destroy
	has_many :students, through: :my_courses
	has_many :homeworks
	has_many :publications
	belongs_to :student
	has_many :topics
	def firstTopics
		self.topics.where(corte: 1)
	end
	def secondTopics
		self.topics.where(corte: 2)
	end
	def thirdTopics
		self.topics.where(corte: 3)
	end
end
