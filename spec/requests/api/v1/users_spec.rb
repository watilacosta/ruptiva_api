require 'swagger_helper'
require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  context 'GET /users' do
    headers = { "ACCEPT" => "application/vnd.api+json" }

    describe 'returns users' do
      get '/index', format: :json, headers: headers

      it { should respond_with(200) }
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to match_json_schema("users")
    end
  end
end
