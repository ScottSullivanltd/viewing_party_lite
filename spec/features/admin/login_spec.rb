require "rails_helper"

RSpec.describe "Admin login" do
  describe "happy path" do
    it "can log in as an admin and get to my dashboard" do
      admin = Person.create(name: "Joe Admin", email: "joe@admin.com", password: "topsecret", role: 2)

      visit login_path
      fill_in :email, with: admin.email
      fill_in :password, with: admin.password
      click_on "Log In"

      expect(current_path).to eq(admin_dashboard_path)
    end
  end

  describe "as default user" do
    it "does not allow default user to see admin dashboard index" do
      person = Person.create(name: "Jimmy Kornkraker", email: "jim@corny.com", password: "password123", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(person)

      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
