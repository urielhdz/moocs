# encoding: utf-8
class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
	def show

  end
  private
  def set_student
    @student = Student.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:student).permit(:nombre, :apellido)
  end
end