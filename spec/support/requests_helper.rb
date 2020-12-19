module Requests
  module JsonHelpers
    def expect_status(expectation)
      expect(response).to have_http_status(expectation)
    end

    def json
      JSON.parse(response.body)
    end
  end

  module HeaderHelpers
    def header_with_authentication(user)
      auth_headers = user.create_new_auth_token

      sign_in user

      {
        'Accept'       => 'application/vnd.api+json',
        'Content-Type' => 'application/json',
        'access-token' => auth_headers['access-token'],
        'client'       => auth_headers['client'],
        'uid'          => auth_headers['uid']
      }
    end

    def header_without_authentication
      { 'content-type' => 'application/json' }
    end
  end
end