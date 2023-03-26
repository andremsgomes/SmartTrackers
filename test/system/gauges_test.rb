require "application_system_test_case"

class GaugesTest < ApplicationSystemTestCase
  setup do
    @gauge = gauges(:one)
  end

  test "visiting the index" do
    visit gauges_url
    assert_selector "h1", text: "Gauges"
  end

  test "should create gauge" do
    visit gauges_url
    click_on "New gauge"

    fill_in "Begin date", with: @gauge.begin_date
    fill_in "End date", with: @gauge.end_date
    fill_in "Name", with: @gauge.name
    fill_in "Time unit", with: @gauge.time_unit
    fill_in "Unit", with: @gauge.unit
    click_on "Create Gauge"

    assert_text "Gauge was successfully created"
    click_on "Back"
  end

  test "should update Gauge" do
    visit gauge_url(@gauge)
    click_on "Edit this gauge", match: :first

    fill_in "Begin date", with: @gauge.begin_date
    fill_in "End date", with: @gauge.end_date
    fill_in "Name", with: @gauge.name
    fill_in "Time unit", with: @gauge.time_unit
    fill_in "Unit", with: @gauge.unit
    click_on "Update Gauge"

    assert_text "Gauge was successfully updated"
    click_on "Back"
  end

  test "should destroy Gauge" do
    visit gauge_url(@gauge)
    click_on "Destroy this gauge", match: :first

    assert_text "Gauge was successfully destroyed"
  end
end
