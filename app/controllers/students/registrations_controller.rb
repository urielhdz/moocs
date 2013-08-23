class Students::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:nombre,
        :email, :password, :password_confirmation, :current_password, :apellido,:biografia,:img)
    end
	end
end 