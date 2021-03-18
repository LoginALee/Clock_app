require 'rails_helper'

RSpec.describe 'Timezones', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'returns a success response' do
        get profile_path
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      before { get profile_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      before { sign_in(user) }

      context 'timezone' do
        it 'returns a success response' do
          get edit_time_zone_path(user.id)
          expect(response).to be_successful
        end
      end

      context 'profile' do
        it 'returns a success response' do
          get profile_path(user.id)
          expect(response).to be_successful
        end
      end
    end

    context 'when user is not signed in' do
      context 'timezone' do
        before { get edit_time_zone_path(user.id) }

        it 'does not render a page' do
          expect(response).not_to be_successful
        end

        it 'is redirected to sign in' do
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'profile' do
        before { get profile_path }

        it 'does not render a page' do
          expect(response).not_to be_successful
        end

        it 'is redirected to sign in' do
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe '#update' do
    context 'when user is signed in' do
      before { sign_in(user) }

      context 'timezone' do
        it 'update with valid attributes' do
          patch edit_time_zone_path(user), params: { id: user.id, user: { time_zone: '(GMT-06:00) Guadalajara' } }
          expect(response).to redirect_to(timezones_path)
        end
      end

      context 'profile' do
        it 'update with valid attributes' do
          patch user_path(user), params: { id: user.id, user: { time_zone: '(GMT-06:00) Guadalajara' } }
          expect(response).to redirect_to(root_path)
        end

        it 'update with invalid attributes' do
          patch user_path(user), params: { id: user.id, user: { time_zone: nil } }
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'when user is not signed in' do
    end
  end
end
