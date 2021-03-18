require 'rails_helper'

RSpec.describe 'Errors', type: :request do
  let!(:user) { create(:user) }

  before do
    allow(Rails.application).to receive(:env_config).with(no_args).and_wrap_original do |m, *_args|
      m.call.merge(
        'action_dispatch.show_exceptions' => true,
        'action_dispatch.show_detailed_exceptions' => false
      )
    end
  end

  describe 'GET' do
    context '#not_found' do
      it 'returns a success response' do
        get '/asdas'
        expect(response.body).to include('Not Found')
      end
    end
  end
end
