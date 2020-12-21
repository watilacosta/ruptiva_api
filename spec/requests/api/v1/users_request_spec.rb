require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  let(:user) { create(:common_user) }
  let(:admin) { create(:user_admin) }

  describe 'GET #index' do
    context 'when User is an admin' do
      before do
        get api_v1_users_path, headers: header_with_authentication(admin)
      end

      it { expect_status(:ok) }

      it 'returns users json schema' do
        expect(response).to match_response_schema('user')
      end
    end

    context  'when User is a common user' do
      before do
        get api_v1_users_path, headers: header_with_authentication(user)
      end

      it { expect_status(:unauthorized) }
    end
  end

  describe 'POST #create' do
    context 'when User is an admin' do
      before do
        attributes = attributes_for(:common_user)

        post api_v1_users_path, params: { user: attributes },
             headers: header_with_authentication(admin)
      end

      it { expect_status(:created) }
    end

    context 'when User is a common user' do
      before do
        attributes = attributes_for(:common_user)

        post api_v1_users_path, params: { user: attributes },
             headers: header_with_authentication(user)
      end

      it { expect_status(:unauthorized) }
    end
  end

  describe 'PATCH #update' do
    context 'when User is an admin' do
      before do
        @attributes = attributes_for(:user, first_name: 'Fulano')

        patch api_v1_user_path(user.id), params: { user: @attributes },
              headers: header_with_authentication(admin)
      end

      it { expect_status(:ok) }

      it "user are updated with correct data" do
        user.reload
        expect(user.first_name).to eql(@attributes[:first_name])
      end
    end

    context 'when User is a common user' do
      before do
        @attributes = attributes_for(:user, first_name: 'Fulano')

        patch api_v1_user_path(user.id), params: { user: @attributes },
              headers: header_with_authentication(user)
      end

      it { expect_status(:unauthorized) }
    end
  end

  describe 'DELETE #destroy' do
    context 'when User is an admin' do
      before do
        delete api_v1_user_path(user.id), params: {},
               headers: header_with_authentication(admin)
      end

      it { expect_status(:no_content) }

      it "user are deleted" do
        expect(User.where(id: user.id).present?).to eql(false)
      end
    end

    context 'when User is a common user' do
      before do
        delete api_v1_user_path(user.id), params: {},
               headers: header_with_authentication(user)
      end

      it { expect_status(:unauthorized) }
    end
  end

  describe 'GET #show' do
    context 'when User is an admin' do
      context 'when user exists' do
        before do
          get api_v1_user_path(user.id), params: {},
              headers: header_with_authentication(admin)
        end

        it { expect_status(:ok) }
      end

      context 'when user not exists' do
        before do
          get api_v1_user_path(-1), params: {},
              headers: header_with_authentication(admin)
        end

        it { expect_status(:not_found) }
      end
    end

    context 'when User is a common user' do
      context 'show another user' do
        let(:another_user) { create(:common_user)}

        before do
          get api_v1_user_path(another_user.id), params: {},
              headers: header_with_authentication(user)
        end

        it { expect_status(:unauthorized) }
      end

      context 'show self user' do
        before do
          get api_v1_user_path(user.id), params: {},
              headers: header_with_authentication(user)
        end

        it { expect_status(:ok) }
      end
    end
  end
end