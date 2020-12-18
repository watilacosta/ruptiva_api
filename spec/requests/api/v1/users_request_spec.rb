require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  describe 'GET /users' do
    let(:user) { create(:user_admin) }

    let(:auth_headers) { user.create_new_auth_token }

    before do
      sign_in user

      headers = {
        'Accept'       => 'application/vnd.api+json',
        'Content-Type' => 'application/json',
        'access-token' => auth_headers['access-token'],
        'client'       => auth_headers['client'],
        'uid'          => auth_headers['uid']
      }

      get '/users', headers: headers
    end

    context 'When user is admin' do
      it { expect(response).to have_http_status(:ok) }

      # it 'returns users json schema' do
      #   expect(response).to match_response_schema('user')
      # end
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