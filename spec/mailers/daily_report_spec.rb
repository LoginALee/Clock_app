require 'rails_helper'

RSpec.describe 'DailyReport', tipe: :mailer do
  describe 'Send a Daily Report' do
    let!(:user) { create(:user) }
    let(:mail) { UserMailer.with(user: user).daily_report }

    it 'renders the headers' do
      expect(mail.subject).to eq('Daily report')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Hi, #{user.email}")
      expect(mail.body.encoded).to match(user.stopwatches.first.to_s)
    end
  end
end
