require "swagger_helper"

RSpec.describe "api/v1/users_controller", type: :request do
  path "/api/v1/users" do
    get "List Users" do
      tags 'Users'
      consumes "application/json"

      response "200", "Listing Users" do
        run_test!
      end
    end

    post "Create an User" do
      tags "Users"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name:  { type: :string },
          email:      { type: :string },
          password:   { type: :string },
          role:       { type: :integer },
        },
        required: %w[first_name last_name email password role],
      }

      response "201", "user created" do
        let(:user) { attributes_for(:common_user) }
        run_test!
      end

      response "422", "invalid request" do
        let(:user) { { fist_name: nil } }
        run_test!
      end
    end
  end

  path "/api/v1/users/{id}" do
    get 'Show an User' do
      tags "Users"
      consumes "application/json"

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: %w[id]
      }

      response "200", "user show" do
        let(:user) { create(:common_user) }
        run_test!
      end

      response "404", "not found" do
        let(:user) { { id: nil } }
        run_test!
      end
    end

    patch 'Update an User' do
      tags "Users"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name:  { type: :string },
          email:      { type: :string },
          password:   { type: :string },
          role:       { type: :integer },
        },
        required: %w[first_name last_name email password]
      }

      response "200", "user updated" do
        let(:user) { attributes_for(:common_user) }
        run_test!
      end

      response "422", "invalid request" do
        let(:user) { { role: nil } }
        run_test!
      end
    end

    delete 'Delete an User' do
      tags "Users"
      consumes "application/json"

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: %w[id]
      }

      response "204", "no_content" do
        let(:user) { create(:common_user) }
        run_test!
      end

      response "404", "not found" do
        let(:user) { { id: nil } }
        run_test!
      end
    end
  end
end
