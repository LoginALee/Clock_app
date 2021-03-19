require 'rails_helper'

RSpec.feature 'User creates a alarm', type: :feature do
  let!(:user) { create(:user) }
  let(:alarm) { build(:alarm) }

  background do
    sign_in user
    visit alarms_path
  end

  scenario 'with valid values' do
    alarm_presenter = AlarmPresenter.new(alarm)
    click_on 'New Alarm'
    fill_in 'alarm_time', with: alarm_presenter.time_with_hour_minutes
    find("#alarm_days_#{alarm.days.first.downcase}").set(true)
    click_on 'Create Alarm'
    expect(page).to have_content(alarm_presenter.time_with_hour_minutes)
    expect(page).to have_content(alarm_presenter.days_abbreviations.first)
    expect(current_path).to eq(alarms_path)
  end
end
