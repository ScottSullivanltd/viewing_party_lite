class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new(person_params)
  end

  def create
    person = person_params
    person[:email] = person[:email].downcase
    new_person = Person.create(person)
    if new_person.save
      flash[:success] = "Welcome, #{new_person.name}!"
      redirect_to person_path(new_person.id)
    else
      flash[:alert] = new_person.errors.full_messages.to_sentence
      render :new
    end
  end

  def login_form
  end

  def login
    person = Person.find_by(email: params[:email])
    if person.authenticate(params[:password])
      session[:person_id] = person.id
      flash[:success] = "Welcome, #{person.name}!"
      redirect_to person_path(person.id)
    else
      flash[:alert] = "Incorrect Input. Please Try Again"
      redirect_to login_path
    end
  end

  private

  def person_params
    params.permit(:name, :email, :password)
  end
end
