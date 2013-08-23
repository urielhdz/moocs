class WelcomeController < ApplicationController
	skip_before_action :check_authentication!, :only => :index
	before_action :getCourses
  def index
  	@courses = Course.limit(10)
  	@activities = PublicActivity::Activity.order("created_at DESC").where(owner_id: current_student.friend_and_i_ids, owner_type: "Student")
  end
  def getCourses
  	@courses = Course.order("created_at DESC")
  end

end
