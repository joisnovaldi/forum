class ApplicationController < ActionController::Base
   include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
rescue_from Pundit::NotAuthorizedError, with: :pundit_error

private

def pundit_error
    flash[:notice] = 'Tidak memiliki hak akses'
    redirect_to root_path
end

def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end
end