require 'rails_helper'

describe "As a mechant employee or merchant admin" do
  before :each do
    @merchant_employee = User.create(name: "alec",
      address: "234 Main",
      city: "Denver",
      state: "CO",
      zip: 80204,
      email: "alec@gmail.com",
      password: "password",
      role: 2)
      allow_any_instance_of(ApplicationController)
      .to receive(:current_user)
      .and_return(@merchant_employee)
  end

  it "I see same links as regular user and link to dashboard" do
    visit '/items'
    within '.topnav' do
      expect(page).to have_link("Merchant Dashboard")
    end
  end
end
