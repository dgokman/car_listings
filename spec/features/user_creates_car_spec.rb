require "rails_helper"

feature "Create car" do
  scenario "user creates car succesfully" do
    visit new_manufacturer_path

    fill_in "manufacturer_name", with: "Saab"
    fill_in "Country", with: "Sweden"

    visit new_car_path
    select "manufacturer_id", match: :first
    fill_in "Color", with: "Yellow"

    fill_in "car_year", with: "1925"
    fill_in "car_mileage", with: "1000"
    click_on "Create Car"

    expect(page).to have_content "Car created successfully"
  end

  scenario "user doesn't enter color" do
    visit new_manufacturer_path

    fill_in "manufacturer_name", with: "Saab"
    fill_in "Country", with: "Sweden"

    visit new_car_path

    select "manufacturer_id", match: :first
    fill_in "car_year", with: "1925"
    fill_in "car_mileage", with: "1000"
    click_on "Create Car"

    expect(page).to have_content "Color can't be blank"
  end

  scenario "user enters year earlier than 1920" do

    fill_in "car_year", with: "1915"

    expect(page).to have_content "Year must be greater than or equal to 1920"
  end

  scenario "user enters non-integer for mileage" do

    fill_in "car_mileage", with: "one hundred"

    expect(page).to have_content "Mileage is not a number"
  end
end
