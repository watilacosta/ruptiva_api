require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  context 'when authenticated' do
    describe 'GET /users' do
      context 'when User is an admin' do
        let(:admin) { create(:user_admin) }

        before do
          get api_v1_users_path, headers: header_with_authentication(admin)
        end

        it { expect_status(:ok) }

        it 'returns users json schema' do
          expect(response).to match_response_schema('user')
        end
      end

      context  'when User is a common user' do
        let(:user) { create(:common_user) }

        before do
          get api_v1_users_path, headers: header_with_authentication(user)
        end

        it { expect_status(:unauthorized) }
      end
    end

    describe 'POST /users' do
    end

    describe 'PATCH /users' do
    end

    describe 'DELETE /users' do
    end

    describe 'GET /users/:id' do
    end
  end

  context 'when unauthenticated ' do
    describe 'POST /users' do
    end

    describe 'PATCH /users' do
    end

    describe 'DELETE /users' do
    end

    describe 'GET /users/:id' do
    end
  end
end