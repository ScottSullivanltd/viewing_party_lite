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
    flash[:success] = "Welcome, #{new_person.name}!"
    redirect_to person_path(new_person.id)
  end

  private

  def person_params
    params.permit(:name, :email, :password)
  end
end
