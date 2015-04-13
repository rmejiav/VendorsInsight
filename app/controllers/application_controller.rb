class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include LoginHelper
    
    helper_method :admin?
    protected
    
    def admin?
        false
    end
    
    def authorize
        unless admin?
            flash[:error] = "acceso no autorizado"
            redirect_to login_path
            false
        end
    end
        
    
    
end
