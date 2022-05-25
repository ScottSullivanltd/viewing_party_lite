class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    Person.find(session[:person_id]) if session[:person_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    render file: "/public/404" unless current_admin
    redirect_to root_path
  end
end
