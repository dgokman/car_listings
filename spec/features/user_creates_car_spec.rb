require "rails_helper"
require_relative "user_creates_car_spec"

def create_manufacturer
  visit new_manufacturer_path

  fill_in "manufacturer_name", with: "Saab"
  fill_in "Country", with: "Sweden"
  click_on "Create Manufacturer"

  visit new_car_path
end

feature "Create car" do
  scenario "user creates car succesfully" do
    create_manufacturer

    select "Saab", from: "car_manufacturer_id"
    fill_in "Color", with: "Yellow"

    fill_in "Year", with: "1925"
    fill_in "Mileage", with: "1000"
    click_on "Create Car"

    expect(page).to have_content "Car created successfully"
  end

  scenario "user doesn't enter color" do
    create_manufacturer

    select "Saab", from: "car_manufacturer_id"
    fill_in "Year", with: "1925"
    fill_in "Mileage", with: "1000"
    click_on "Create Car"

    expect(page).to have_content "Color can't be blank"
  end

  scenario "user enters year earlier than 1920" do
    visit new_car_path
    fill_in "Year", with: "1915"
    click_on "Create Car"

    expect(page).to have_content "Year must be greater than or equal to 1920"
  end

  scenario "user enters non-integer for mileage" do
    visit new_car_path
    fill_in "Mileage", with: "one hundred"
    click_on "Create Car"

    expect(page).to have_content "Mileage is not a number"
  end
end
