module ApplicationHelper
	def new_publication
  		Publication.new    
	end
	def new_topic
  		Topic.new    
	end
	def notInMyCourses?(curso)
		(current_student.my_courses.where(course_id: curso.id).first).nil?
	end
	def isMyFriend?(friend)
		 true if Friendship.find(:all, :conditions => ["student_id = ? AND friend_id = ?", current_student.id, friend.id ]).size > 0
	end
end
