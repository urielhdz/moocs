# encoding: utf-8
class MyCoursesController < ApplicationController
	def addCourse
		myCourse = current_student.my_courses.where(:course_id => params[:course_id])
		if myCourse.nil? || myCourse.size < 1
        myCourse = MyCourse.new(course_params)
    		myCourse.save
    end
    respond_to do |format|
    	format.json { render json: myCourse }
    end
  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.permit(:course_id, :student_id)
  end
end