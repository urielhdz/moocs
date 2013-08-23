# encoding: utf-8
class FriendshipsController < ApplicationController
	def addFriend
		friendship = current_student.friendships.where(friend_id: params[:friend_id])
		if friendship.nil? || friendship.size < 1
        friendship = current_student.friendships.new(course_params)
    		friendship.save
    end
    respond_to do |format|
    	format.json { render json: friendship }
    end
  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.permit(:friend_id)
  end
end