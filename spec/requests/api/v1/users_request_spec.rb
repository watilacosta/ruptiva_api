require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  describe 'GET /users' do
    context 'When user is admin' do
      let(:user) { create(:user_admin) }
      let(:auth_headers) { user.create_new_auth_token }

      before(:each) do
        sign_in user

        get '/users', headers: {
          'CONTENT_TYPE' => 'application/json',
          'ACCEPT'       => 'application/vnd.api+json',
          'Uid'          => auth_headers['uid'],
          'Access-Token' => auth_headers['access-token'],
          'Client'       => auth_headers['client']
        }
      end

      it { expect(response).to have_http_status(:ok) }

      it 'returns users json schema' do
        expect(response).to match_response_schema('user')
      end
    end
  end


  context 'POST /users' do
  end

  context 'PATCH /users' do
  end

  context 'DELETE /users' do
  end

  context 'GET /users/:id' do
  end
end