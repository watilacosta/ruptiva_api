require "swagger_helper"

RSpec.describe "api/v1/DeviseTokenAuth::SessionsController", type: :request do
  path "/api/v1/auth/sign_in" do
    post "Sign_in User" do
      tags 'Sessions'
      consumes "application/vnd.api+json"

      parameter name: :auth, in: :header, schema: {
        type: :object,
        properties: {
          email:      { type: :string },
          password:   { type: :string },
        },
        required: %w[email password],
      }

      response "200", "Logged user" do
        run_test!
      end
    end
  end

  path "/api/v1/auth/sign_out" do
    delete "Sign_out User" do
      tags 'Sessions'
      consumes "application/vnd.api+json"
      parameter name: :auth, in: :header, schema: {
        type: :object,
        properties: {
          'access-token': { type: 'string' },
          'client':       { type: 'string' },
          'uid':          { type: 'string' },
        }
      }

      response "200", "Sign-out User" do
        run_test!
      end
    end
  end
end