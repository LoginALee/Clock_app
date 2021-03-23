require 'rails_helper'

RSpec.describe 'AlarmActivaded', tipe: :mailer do
  describe 'Send a Alarm activated Alert' do
    subject { create(:alarm) }
    let(:mail) { UserMailer.with(user: subject.user, alarm: subject).alarm_activated }

    it 'renders the headers' do
      expect(mail.subject).to eq('Alarm activated')
      expect(mail.to).to eq([subject.user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      alarm_presenter = AlarmPresenter.new(subject)
      expect(mail.body.encoded).to match("Hi, #{subject.user.email}")
      expect(mail.body.encoded).to match('You have activated the next alarm')
      expect(mail.body.encoded).to match(alarm_presenter.time_with_hour_minutes.to_s)
    end
  end
end
