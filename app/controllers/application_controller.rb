class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :birth_day])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_registration_path, :notice => 'Please Sign in'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def after_sign_in_path_for(resource)
    # posts_path(resource) # <- Path you want to redirect the user to.
    posts_path # <- Path you want to redirect the user to.
  end

end
