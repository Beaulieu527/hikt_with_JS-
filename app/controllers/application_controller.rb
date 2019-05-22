class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
          user_params.permit(:name, :email)
        end
      end
end
