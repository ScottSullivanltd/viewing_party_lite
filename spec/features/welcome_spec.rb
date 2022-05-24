require "rails_helper"

RSpec.describe "Welcome Page" do
  it "displays title of application" do
    visit root_path
    expect(page).to have_content("View Party")
  end

  it "has button to create new user" do
    visit root_path
    expect(page).to have_button("Create New User")
  end

  it "has list of each user with link to each user's dashboard" do
    person1 = Person.create!(name: "Scott Pascale", email: "spascale@mailg.com", password: "password123")
    person2 = Person.create!(name: "Luke Sullivan", email: "lsullivan@mailg.com", password: "password321")

    visit root_path

    expect(page).to have_link(person1.name)
    expect(page).to have_link(person2.name)

    click_link person1.name

    expect(current_path).to eq(person_path(person1.id))
  end

  it "has link to go back to landing page" do
    visit root_path

    expect(page).to have_link("Welcome Page")
  end

  describe "Logging In" do
    it "can log in with valid credentials" do
      person1 = Person.create!(name: "Scott Pascale", email: "spascale@mailg.com", password: "password123")

      visit root_path

      click_link "I already have an account"

      expect(current_path).to eq(login_path)

      fill_in :email, with: person1.email
      fill_in :password, with: person1.password

      click_on "Log In"

      expect(current_path).to eq(person_path(person1.id))
      expect(page).to have_content("Welcome, #{person1.name}!")
    end
  end
end
