class SessionsController < ApplicationController
  def new
  end

  def create
    person = Person.find_by_email(params[:email].downcase)
    if person && person.authenticate(params[:password])
      session[:person_id] = person.id
      flash[:success] = "Welcome, #{person.email}!"
      redirect_to person_path(person.id)
    else
      flash[:alert] = "Incorrect Input. Please Try Again"
      redirect_to login_path
    end
  end
end
