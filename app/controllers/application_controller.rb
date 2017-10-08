class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: "You are not authorized to access these pages without login."
  end
end
