require "rails_helper"
require_relative "user_creates_car_spec"

feature "Create car" do
  scenario "user creates car succesfully" do
    visit new_manufacturer_path
    fill_in "manufacturer_name", with: "Saab"
    fill_in "Country", with: "Sweden"

    click_on "Create Manufacturer"

    expect(page).to have_content "Manufacturer created successfully"
  end

  scenario "user doesn't enter manufacturer" do
    visit new_manufacturer_path

    fill_in "Country", with: "Sweden"

    click_on "Create Manufacturer"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "user doesn't enter country" do
    visit new_manufacturer_path

    fill_in "manufacturer_name", with: "Saab"

    click_on "Create Manufacturer"

    expect(page).to have_content "Country can't be blank"
  end

  scenario "user enters duplicate manufacturer" do
    create_manufacturer
    visit new_manufacturer_path
    fill_in "manufacturer_name", with: "Saab"
    fill_in "Country", with: "Sweden"

    click_on "Create Manufacturer"

    expect(page).to have_content "Name has already been taken"
  end

end
