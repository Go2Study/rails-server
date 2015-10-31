class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  # Disable CSRF Protection since we're going API only
  skip_before_action :verify_authenticity_token
end
