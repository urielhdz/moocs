
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_action :check_authentication!
  layout :layout_by_resource  
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Student)
      "/students/edit"
    else
      super
    end
  end
  def check_authentication!
    @courses = Course.order("created_at DESC")
  	redirect_to "/", error: 'Necesitas estar logueado para ir ahí' unless student_signed_in? || params[:controller] == 'devise/sessions' || params[:controller] == 'students/registrations'
  end

  def layout_by_resource
  	if devise_controller? and not (params[:controller] == 'students/registrations' and params[:action] == "edit")
  		"welcome"
  	else
  		"application"
  	end
  end
end
