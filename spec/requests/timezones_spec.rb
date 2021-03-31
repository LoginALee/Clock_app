require 'rails_helper'

RSpec.describe 'Timezones', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'returns a success response' do
        get timezones_path
        expect(response).to be_successful
      end

      context 'has timezone' do
        let!(:timezone) { create(:timezone, user: user) }

        it 'shows timezone saved' do
          get timezones_path
          expect(response.body).to include(timezone.name)
        end
      end
    end

    context 'when user is not signed in' do
      before { get timezones_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      before { sign_in(user) }
      it 'returns a success response' do
        get new_timezone_path
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      before { get new_timezone_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:timezone_valid_params) { { timezone: attributes_for(:timezone, user: user) } }

    context 'when user is logged in' do
      let(:timezone_invalid_params) { { timezone: attributes_for(:timezone, name: nil) } }

      before { sign_in(user) }

      context 'with valid params' do
        it 'creates a new timezone' do
          post timezones_path, params: timezone_valid_params
          expect(Timezone.count).to eq(1)
          expect(response).to redirect_to(timezones_path)
        end
      end

      context 'with invalid params' do
        it 'redirects a create new timezone' do
          post timezones_path, params: { timezone: timezone_invalid_params }
          expect(response).to render_template :new
        end
      end
    end

    context 'when user is not signed in' do
      before { post timezones_path, params: { timezone: timezone_valid_params } }

      it 'returns a not success response' do
        expect(response).not_to be_successful
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Delete #destroy' do
    let!(:timezone) { create(:timezone) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'deletes the timezone' do
        expect do
          delete timezone_path(timezone), params: { id: timezone.id }
        end.to change(Timezone, :count).by(-1)
      end

      it 'redirects to the timezones' do
        delete timezone_path(timezone), params: { id: timezone.id }
        expect(response).to redirect_to(timezones_path)
      end
    end

    context 'when user is not signed in' do
      before { delete timezone_path(timezone), params: { id: timezone.id } }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
