require 'rails_helper'

RSpec.feature 'User visits', type: :feature do
  let!(:user) { create(:user) }

  background do
    sign_in user
  end

  scenario 'the main page' do
    visit root_path

    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Clock App'
  end

  scenario 'the alarms page' do
    visit alarms_path

    expect(page.status_code).to eq(200)
    expect(page).to have_selector('h3', text: 'My Alarms')
  end

  scenario 'the timezones page' do
    visit timezones_path

    expect(page.status_code).to eq(200)
    expect(page).to have_selector('h3', text: 'My Time Zones')
  end

  scenario 'the stopwatches page' do
    visit stopwatches_path

    expect(page.status_code).to eq(200)
    expect(page).to have_selector('h3', text: 'Stopwatch')
  end

  scenario 'the stopwatches page' do
    visit timers_path

    expect(page.status_code).to eq(200)
    expect(page).to have_selector('h3', text: 'Timers')
  end
end
