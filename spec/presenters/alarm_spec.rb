require 'rails_helper'

RSpec.describe AlarmPresenter do
  let(:alarm) { create(:alarm) }
  let(:alarm_presenter) { AlarmPresenter.new(alarm) }

  describe 'show time format (HH:MM)' do
    it { expect(alarm_presenter.time_with_hour_minutes).to eq('00:39') }
  end

  describe 'show time format (HH:MM:SS)' do
    it { expect(alarm_presenter.time_with_hour_minutes_seconds).to eq('00:39:28') }
  end

  describe 'show abbreviated day names' do
    it { expect(alarm_presenter.days_abbreviations).to eq(%w[Mon Wed Fri]) }
  end

  describe 'show day name in line' do
    it { expect(alarm_presenter.days_inline).to eq('Monday, Wednesday, Friday') }
  end
end
