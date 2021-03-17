require 'rails_helper'

RSpec.describe AlarmPresenter do
  let(:alarm) { create(:alarm) }
  let(:alarm_presenter) { AlarmPresenter.new(alarm) }

  describe 'show time format (HH:MM)' do
    it { expect(alarm_presenter.time_with_hour_minutes).to eq(alarm.time.strftime('%H:%M')) }
  end

  describe 'show time format (HH:MM:SS)' do
    it { expect(alarm_presenter.time_with_hour_minutes_seconds).to eq(alarm.time.strftime('%H:%M:%S')) }
  end

  describe 'show abbreviated day names' do
    it { expect(alarm_presenter.days_abbreviations).to eq(alarm.days.map { |day| day[0...3] }) }
  end

  describe 'show day name in line' do
    it { expect(alarm_presenter.days_inline).to eq(alarm.days.join(', ')) }
  end
end
