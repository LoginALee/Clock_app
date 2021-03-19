require 'rails_helper'

RSpec.feature 'User delete a alarm', type: :feature, feature: true do
  let!(:user) { create(:user) }
  let!(:alarm) { create(:alarm, user: user) }

  background do
    sign_in user
    visit alarms_path
  end

  scenario 'successful' do
    within('.row.justify-content-end.ml-auto') do
      find('a', text: 'Delete').click
    end
    expect(Alarm.count).to eq(0)
    expect(current_path).to eq(alarms_path)
  end
end
