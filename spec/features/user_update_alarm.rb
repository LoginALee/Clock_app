require 'rails_helper'

RSpec.feature 'User update a alarm', type: :feature do
  let!(:user) { create(:user) }
  let!(:alarm) { create(:alarm, user: user) }
  let(:new_alarm) { AlarmPresenter.new(build(:alarm)) }

  background do
    sign_in user
    visit alarms_path
  end

  scenario 'with valid values' do
    within('.row.justify-content-end.ml-auto') do
      find('a', text: 'Edit').click
    end
    fill_in 'alarm_time', with: new_alarm.time_with_hour_minutes
    find('#alarm_days_monday').set(false)
    click_on 'Update Alarm'
    expect(page).to have_content(new_alarm.time_with_hour_minutes)
    expect(page).to have_no_content('Mon')
    expect(current_path).to eq(alarms_path)
  end
end
