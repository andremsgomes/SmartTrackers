require 'rails_helper'

# rubocop:disable Metrics/BlockLength

describe 'Show gauge', type: :feature do
  let(:gauge1) do
    Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
                 time_unit: :days)
  end

  before do
    visit("/gauges/show/#{gauge1.id}")
  end

  it 'displays the name of the Web Application in the title' do
    expect(page).to have_title 'SmartTrackers'
  end

  it 'displays the name of the gauge' do
    expect(page).to have_content('Gauge 1')
  end

  it 'displays the begin date of the gauge' do
    expect(page).to have_content('2022/01/01')
  end

  it 'displays the end date of the gauge' do
    expect(page).to have_content('2023/01/01')
  end

  it 'displays the measure unit of the gauge' do
    expect(page).to have_content('kwh')
  end

  it 'displays the time unit of the gauge' do
    expect(page).to have_content('days')
  end

  it 'displays the entries' do
    expect(page).to have_content('Entries')
  end

  context 'when there are no entries' do
    it 'displays a message' do
      expect(page).to have_content('There are no entries for this gauge yet!')
    end
  end

  context 'when there are entries' do
    before do
      gauge1.gauge_entries.create(created_at: DateTime.new(2022, 1, 2), value: 3.3)
      gauge1.gauge_entries.create(created_at: DateTime.new(2022, 1, 3), value: 4.8)
      visit("/gauges/show/#{gauge1.id}")
    end

    it 'displays the date of the first entry' do
      expect(page).to have_content('2022/01/02')
    end

    it 'displays the value of the first entry' do
      expect(page).to have_content('3.3 kwh')
    end

    it 'displays the date of the second entry' do
      expect(page).to have_content('2022/01/03')
    end

    it 'displays the value of the second entry' do
      expect(page).to have_content('4.8 kwh')
    end

    it 'displays the total value of the entries' do
      expect(page).to have_content("#{3.3 + 4.8} kwh")
    end
  end
end