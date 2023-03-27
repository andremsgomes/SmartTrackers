require 'rails_helper'

describe 'Gauges list', type: :feature do
  it 'displays the name of the Web Application in the title' do
    visit('/')
    expect(page).to have_title 'SmartTrackers'
  end

  it 'displays the list title' do
    visit('/')
    expect(page).to have_content('Gauges')
  end

  context 'when there are gauges' do
    before do
      Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
                   time_unit: :days)
      Gauge.create(name: 'Gauge 2', begin_date: DateTime.new(2022, 6, 1), end_date: DateTime.new(2025, 6, 1), unit: :kwh,
                   time_unit: :months)
    end

    it 'displays the name of the first gauge' do
      visit('/')
      expect(page).to have_content('Gauge 1')
    end

    it 'displays the begin and end date of the first gauge' do
      visit('/')
      expect(page).to have_content('2022/01/01 - 2023/01/01')
    end

    it 'displays the name of the second gauge' do
      visit('/')
      expect(page).to have_content('Gauge 2')
    end

    it 'displays the begin and end date of the second gauge' do
      visit('/')
      expect(page).to have_content('2022/06/01 - 2025/06/01')
    end
  end
end

