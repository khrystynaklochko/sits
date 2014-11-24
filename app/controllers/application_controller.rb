class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

private

    def current_user
      @current_user ||= Operator.find(session[:operator_id]) if session[:operator_id]
    end
    helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end
end
