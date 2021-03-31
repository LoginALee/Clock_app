require 'rails_helper'

RSpec.describe 'Alarms', type: :request do
  let!(:user) { create(:user) }

  describe '#index' do
    context 'when user is logged in' do
      before { sign_in user }

      it 'response is successful' do
        get alarms_path
        expect(response).to be_successful
      end

      context 'when there are alarms saved' do
        let!(:alarm) { create(:alarm, user: user) }

        it 'alarm assigned' do
          get alarms_path
          alarm_presenter = AlarmPresenter.new(alarm)
          expect(response.body).to include(alarm_presenter.time_with_hour_minutes)
        end
      end
    end

    context 'when user is not signed in' do
      before { get alarms_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#new' do
    context 'when user is logged in' do
      before { sign_in user }

      it 'response is successful' do
        get new_alarm_path
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      before { get new_alarm_path }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
    context 'when user is logged in' do
      let!(:user) { create(:user) }
      let(:alarm_valid) { { alarm: attributes_for(:alarm, user: user) } }
      let(:alarm_invalid) { { alarm: attributes_for(:alarm, time: nil) } }

      before { sign_in user }

      it 'creates alarm with valid attributes' do
        post alarms_path, params: alarm_valid
        expect(response).to redirect_to(alarms_path)
      end

      it 'creates alarm with invalid attributes' do
        alarm_params = {
          time: '2000-01-01 00:39:28',
          user_id: user.id
        }
        post alarms_path, params: alarm_invalid
        expect(response).to render_template :new
      end
    end

    context 'when user is not signed in' do
      let(:alarm_valid) { { alarm: attributes_for(:alarm, user: user) } }
      
      before { post alarms_path, params: alarm_valid }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#edit' do
    let!(:alarm) { create(:alarm) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'response is successful' do
        get edit_alarm_path(alarm.id)
        expect(response).to be_successful
      end
    end

    context 'when user is not signed in' do
      before { get edit_alarm_path(alarm.id) }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#update' do
    let(:alarm) { create(:alarm) }
    let(:alarm_params) { attributes_for(:alarm) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'update with valid attributes' do
        patch alarm_path(alarm), params: { id: alarm.id, alarm: alarm_params }
        expect(response).to redirect_to(alarms_path)
      end

      it 'update with invalid attributes' do
        patch alarm_path(alarm), params: { id: alarm.id, alarm: { time: nil } }
        expect(response).to render_template :edit
      end
    end

    context 'when user is not signed in' do
      before { put alarm_path(alarm), params: { id: alarm.id, alarm: alarm_params } }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#destroy' do
    let!(:alarm) { create(:alarm) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'deletes the alarm' do
        expect do
          delete alarm_path(alarm), params: { id: alarm.id }
        end.to change(Alarm, :count).by(-1)
      end
    end

    context 'when user is not signed in' do
      before { delete alarm_path(alarm), params: { id: alarm.id } }

      it 'does not render a page' do
        expect(response).not_to be_successful
      end

      it 'is redirected to sign in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
