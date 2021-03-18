require 'rails_helper'

RSpec.describe 'Timers', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'returns a success response' do
        get timers_path
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      before { get timers_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
