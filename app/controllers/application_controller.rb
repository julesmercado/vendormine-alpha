class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def set_access_control_headers
    logger.info request.headers['Origin']
    headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    headers['Access-Control-Allow-Methods'] = 'POST,GET,OPTIONS, PUT, DELETE'
    headers['Access-Control-Request-Method'] = '*'    
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  private

   def current_user
      @current_user ||= Supplier.find(session[:user_id]) if session[:user_id]
   end

   helper_method :current_user

   def authenticate_user
      if session[:user_id]
        @current_user ||= Supplier.find(session[:user_id])
        return true
      else
        redirect_to(:controller => 'suppliers', :action => 'login')
        return false
      end
   end

   def save_login_state
      if session[:user_id] 
        redirect_to(:controller => 'suppliers', :action => 'index')
        return false
      else
        return true
      end
  end

end
