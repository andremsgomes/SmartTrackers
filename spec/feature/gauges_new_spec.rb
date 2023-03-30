require 'rails_helper'

# rubocop:disable Metrics/BlockLength

describe 'New gauge entry', type: :feature do
  before do
    visit('/gauges/new')
  end

  it 'displays the name of the Web Application in the title' do
    expect(page).to have_title 'SmartTrackers'
  end

  it 'displays an input field for the name of the gauge' do
    expect(page).to have_field('name')
  end

  it 'displays an input field for the begin date of the gauge' do
    expect(page).to have_field('begin')
  end

  it 'displays an input field for the end date of the gauge' do
    expect(page).to have_field('end')
  end

  it 'displays an input field for the measurement unit of the gauge' do
    expect(page).to have_field('unit')
  end

  it 'displays an input field for the time unit of the gauge' do
    expect(page).to have_field('time_unit')
  end

  it 'displays a button to add the gauge' do
    expect(page).to have_button('Add Gauge')
  end

  context 'after clicking the Add Gauge button when there is no name' do
    before do
      click_button('Add Gauge')
    end

    it 'displays an error message' do
      expect(page).to have_content('You must introduce a valid name.')
    end

    it 'displays the name of the Web Application in the title' do
      expect(page).to have_title 'SmartTrackers'
    end

    it 'displays an input field for the name of the gauge' do
      expect(page).to have_field('name')
    end

    it 'displays an input field for the begin date of the gauge' do
      expect(page).to have_field('begin')
    end

    it 'displays an input field for the end date of the gauge' do
      expect(page).to have_field('end')
    end

    it 'displays an input field for the measurement unit of the gauge' do
      expect(page).to have_field('unit')
    end

    it 'displays an input field for the time unit of the gauge' do
      expect(page).to have_field('time_unit')
    end

    it 'displays a button to add the gauge' do
      expect(page).to have_button('Add Gauge')
    end
  end

  context 'after clicking the Add Gauge button when there is a name but no begin date' do
    before do
      fill_in 'name', with: 'test gauge'
      click_button('Add Gauge')
    end

    it 'displays an error message' do
      expect(page).to have_content('You must introduce a valid begin date.')
    end

    it 'displays the name of the Web Application in the title' do
      expect(page).to have_title 'SmartTrackers'
    end

    it 'displays an input field for the name of the gauge' do
      expect(page).to have_field('name')
    end

    it 'displays an input field for the begin date of the gauge' do
      expect(page).to have_field('begin')
    end

    it 'displays an input field for the end date of the gauge' do
      expect(page).to have_field('end')
    end

    it 'displays an input field for the measurement unit of the gauge' do
      expect(page).to have_field('unit')
    end

    it 'displays an input field for the time unit of the gauge' do
      expect(page).to have_field('time_unit')
    end

    it 'displays a button to add the gauge' do
      expect(page).to have_button('Add Gauge')
    end
  end

  context 'after clicking the Add Gauge button when there is a name and begin date but no end date' do
    before do
      fill_in 'name', with: 'test gauge'
      fill_in 'begin', with: '01-01-2023'
      click_button('Add Gauge')
    end

    it 'displays an error message' do
      expect(page).to have_content('You must introduce a valid end date.')
    end

    it 'displays the name of the Web Application in the title' do
      expect(page).to have_title 'SmartTrackers'
    end

    it 'displays an input field for the name of the gauge' do
      expect(page).to have_field('name')
    end

    it 'displays an input field for the begin date of the gauge' do
      expect(page).to have_field('begin')
    end

    it 'displays an input field for the end date of the gauge' do
      expect(page).to have_field('end')
    end

    it 'displays an input field for the measurement unit of the gauge' do
      expect(page).to have_field('unit')
    end

    it 'displays an input field for the time unit of the gauge' do
      expect(page).to have_field('time_unit')
    end

    it 'displays a button to add the gauge' do
      expect(page).to have_button('Add Gauge')
    end
  end
end
