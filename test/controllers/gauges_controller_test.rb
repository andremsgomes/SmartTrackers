require "test_helper"

class GaugesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gauge = gauges(:one)
  end

  test "should get index" do
    get gauges_url
    assert_response :success
  end

  test "should get new" do
    get new_gauge_url
    assert_response :success
  end

  test "should create gauge" do
    assert_difference("Gauge.count") do
      post gauges_url, params: { gauge: { begin_date: @gauge.begin_date, end_date: @gauge.end_date, name: @gauge.name, time_unit: @gauge.time_unit, unit: @gauge.unit } }
    end

    assert_redirected_to gauge_url(Gauge.last)
  end

  test "should show gauge" do
    get gauge_url(@gauge)
    assert_response :success
  end

  test "should get edit" do
    get edit_gauge_url(@gauge)
    assert_response :success
  end

  test "should update gauge" do
    patch gauge_url(@gauge), params: { gauge: { begin_date: @gauge.begin_date, end_date: @gauge.end_date, name: @gauge.name, time_unit: @gauge.time_unit, unit: @gauge.unit } }
    assert_redirected_to gauge_url(@gauge)
  end

  test "should destroy gauge" do
    assert_difference("Gauge.count", -1) do
      delete gauge_url(@gauge)
    end

    assert_redirected_to gauges_url
  end
end
