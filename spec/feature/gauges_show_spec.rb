require 'rails_helper'
require 'shared_contexts'

# rubocop:disable Metrics/BlockLength

describe 'Show gauge', type: :feature do
  include_context "authentication helper methods"
  include_context "global before and after hooks"
  let!(:user) { User.create(email: 'employee@smarttrackers.com', password: '123456', password_confirmation: '123456') }
  let(:gauge1) do
    Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
                 time_unit: :days)
  end

  before do
    sign_in(user)
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

  it 'displays a button to add a new entry' do
    expect(page).to have_button('Add a new Entry')
  end

  it 'displays a button to sign out' do
    expect(page).to have_button('Sign out')
  end

  context 'when there are no entries' do
    it 'displays a message' do
      expect(page).to have_content('There are no entries for this gauge yet!')
    end
  end

  context 'when there are entries, being some approved and others not' do
    before do
      gauge1.gauge_entries.create(created_at: DateTime.new(2022, 1, 2), value: 3.3, approved: false)
      gauge1.gauge_entries.create(created_at: DateTime.new(2022, 1, 3), value: 4.8, approved: true)
      visit("/gauges/show/#{gauge1.id}")
    end

    it 'displays the date of the first entry' do
      expect(page).to have_content('2022/01/02')
    end

    it 'displays the value of the first entry' do
      expect(page).to have_content('3.3 kwh')
    end

    it 'displays a button to approve the first entry' do
      expect(page).to have_button('Approve')
    end

    it 'displays the date of the second entry' do
      expect(page).to have_content('2022/01/03')
    end

    it 'displays the value of the second entry' do
      expect(page).to have_content('4.8 kwh')
    end

    it 'displays the indication that the second entry is approved' do
      expect(page).to have_content('Approved')
    end

    it 'displays the total value of the entries' do
      expect(page).to have_content("#{3.3 + 4.8} kwh")
    end

    it 'displays the total number of entries approved' do
      expect(page).to have_content("1")
    end
  end
end
