require 'rails_helper'

RSpec.describe 'Stopwatches', type: :request do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in(user) }

      it 'returns a success response' do
        get stopwatches_path
        expect(response).to be_successful
      end

      context 'has stopwatch' do
        let!(:stopwatch) { create(:stopwatch, user: user) }

        it 'shows stopwatch saved' do
          get stopwatches_path
          expect(response.body).to include(stopwatch.name)
        end
      end
    end

    context 'when user is not signed in' do
      before { get stopwatches_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:stopwatch_valid_params) { { stopwatch: attributes_for(:stopwatch, user: user) } }

    context 'when user is logged in' do
      let(:stopwatch_invalid_params) { { name: 'Stopwatch test' } }

      before { sign_in(user) }

      context 'with valid params' do
        it 'creates a new timezone' do
          post stopwatches_path, params: stopwatch_valid_params
          expect(Stopwatch.count).to eq(1)
          expect(response).to redirect_to(stopwatches_path)
        end
      end

      context 'with invalid params' do
        it 'redirects stopwatches' do
          post stopwatches_path, params: { stopwatch: stopwatch_invalid_params }
          expect(response).to redirect_to(stopwatches_path)
        end
      end
    end

    context 'when user is not signed in' do
      before { post stopwatches_path, params: { stopwatch: stopwatch_valid_params } }

      it 'returns a not success response' do
        expect(response).not_to be_successful
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'Delete #destroy' do
    let!(:stopwatch) { create(:stopwatch, user: user) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'deletes the stopwatch' do
        expect do
          delete stopwatch_path(stopwatch), params: { id: stopwatch.id }
        end.to change(Stopwatch, :count).by(-1)
      end

      it 'redirects to the stopwatches' do
        delete stopwatch_path(stopwatch), params: { id: stopwatch.id }
        expect(response).to redirect_to(stopwatches_path)
      end
    end

    context 'when user is not signed in' do
      before { delete stopwatch_path(stopwatch), params: { id: stopwatch.id } }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
