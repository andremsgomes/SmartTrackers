require 'rails_helper'
require 'shared_contexts'

# rubocop:disable Metrics/BlockLength

describe 'New gauge entry', type: :feature do
  include_context "authentication helper methods"
  include_context "global before and after hooks"
  let!(:user) { User.create(email: 'employee@smarttrackers.com', password: '123456', password_confirmation: '123456') }
  let(:gauge1) do
    Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
                 time_unit: :days)
  end

  before do
    sign_in(user)
    visit("/gauges/#{gauge1.id}/gauge_entries/new")
  end

  it 'displays the name of the Web Application in the title' do
    expect(page).to have_title 'SmartTrackers'
  end

  it 'displays the name of the gauge' do
    expect(page).to have_content('Gauge 1')
  end

  it 'displays an input field for the value of the entry' do
    expect(page).to have_field('value')
  end

  it 'displays the measure unit of the gauge' do
    expect(page).to have_content('kwh')
  end

  it 'displays a button to add the entry' do
    expect(page).to have_button('Add Entry')
  end

  it 'displays a button to sign out' do
    expect(page).to have_button('Sign out')
  end

  context 'after clicking the Add Entry button when there is no value' do
    before do
      click_button('Add Entry')
    end

    it 'displays an error message' do
      expect(page).to have_content('You must introduce a valid value.')
    end

    it 'displays the name of the Web Application in the title' do
      expect(page).to have_title 'SmartTrackers'
    end

    it 'displays the name of the gauge' do
      expect(page).to have_content('Gauge 1')
    end

    it 'displays an input field for the value of the entry' do
      expect(page).to have_field('value')
    end

    it 'displays the measure unit of the gauge' do
      expect(page).to have_content('kwh')
    end

    it 'displays a button to add the entry' do
      expect(page).to have_button('Add Entry')
    end
  end
end
