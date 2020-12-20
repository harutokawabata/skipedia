class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    def configure_permitted_parameters
        add_attrs = [:email, :name, :password, :password_confirmation]
        devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :watchword, :encrypted_password, :popular, :is_deleted])
    end
    
     def after_sign_in_path_for(resource)
      case resource
      when Admin
         admins_path
      when User
         root_path
      end
     end
end
