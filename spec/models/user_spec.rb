require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'all attributes' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'validations' do
    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:email)
      expect(subject).to validate_presence_of(:password)
      expect(subject).to validate_presence_of(:time_zone)
    end
  end

  describe 'associations' do
    it { expect(subject).to have_many(:alarms) }
    it { expect(subject).to have_many(:stopwatches) }
    it { expect(subject).to have_many(:timezones) }
    it { expect(subject).to have_one_attached(:avatar) }
  end
end
