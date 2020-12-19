class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    def configure_permitted_parameters
        add_attrs = [:email, :name, :password, :password_confirmation]
        devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
    end
end
