require 'rails_helper'

RSpec.describe Timezone, type: :model do
  subject { create(:timezone) }

  describe 'all attributes' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  describe 'validations' do
    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:user_id)
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      expect(subject).to belong_to :user
    end
  end
end
