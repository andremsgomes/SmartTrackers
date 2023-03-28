require 'rails_helper'

# rubocop:disable Metrics/BlockLength

describe 'Gauges list', type: :feature do
  before do
    visit('/')
  end

  it 'displays the name of the Web Application in the title' do
    expect(page).to have_title 'SmartTrackers'
  end

  it 'displays the list title' do
    expect(page).to have_content('Gauges')
  end

  context 'when there are gauges' do
    let(:gauge1) do
      Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
                   time_unit: :days)
    end
    let(:gauge2) do
      Gauge.create(name: 'Gauge 2', begin_date: DateTime.new(2022, 6, 1), end_date: DateTime.new(2025, 6, 1), unit: :kwh,
                   time_unit: :months)
    end
    before do
      gauge1.gauge_entries.create(value: 3.3)
      gauge1.gauge_entries.create(value: 4.8)
      gauge1.gauge_entries.create(value: 2.9)
      gauge1.gauge_entries.create(value: 5.0)
      gauge1.gauge_entries.create(value: 4.3)
      gauge1.gauge_entries.create(value: 3.6)
      gauge2.gauge_entries.create(value: 28.3)
      gauge2.gauge_entries.create(value: 34.1)
      visit('/')
    end

    it 'displays the name of the first gauge' do
      expect(page).to have_content('Gauge 1')
    end

    it 'displays the begin and end date of the first gauge' do
      expect(page).to have_content('2022/01/01 - 2023/01/01')
    end

    it 'displays the total measured by the first gauge' do
      expect(page).to have_content((3.3 + 4.8 + 2.9 + 5.0 + 4.3 + 3.6).round(1).to_s)
    end

    it 'displays a button to show the details of the first gauge' do
      expect(page).to have_button('Show Details')
    end

    it 'displays the name of the second gauge' do
      expect(page).to have_content('Gauge 2')
    end

    it 'displays the begin and end date of the second gauge' do
      expect(page).to have_content('2022/06/01 - 2025/06/01')
    end

    it 'displays the total measured by the second gauge' do
      expect(page).to have_content((28.3 + 34.1).round(1).to_s)
    end

    it 'displays a button to show the details of the second gauge' do
      expect(page).to have_button('Show Details')
    end
  end
end

