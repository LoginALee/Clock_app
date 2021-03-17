require 'rails_helper'

RSpec.describe Alarm, type: :model do
  subject { create(:alarm) }

  describe 'all attributes' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'validations' do
    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:days)
      expect(subject).to validate_presence_of(:time)
      expect(subject).to validate_presence_of(:user_id)
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(subject).to belong_to :user
    end
  end
end
