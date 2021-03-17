require 'rails_helper'

RSpec.describe Stopwatch, type: :model do
  subject { create(:stopwatch) }

  describe 'all attributes' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'validations' do
    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:time)
      expect(subject).to validate_presence_of(:user_id)
      expect(subject).to validate_presence_of(:name)
    end
  end

  describe 'laps print method' do
    it 'show laps' do
      expect(subject.laps_print).to eq('00:01:00, 00:01:30, 00:02:00')
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(subject).to belong_to :user
    end
  end
end
