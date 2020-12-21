shared_examples_for :deny_without_authorization do |method_type, action, params = {}|
  it 'returns Not Acceptable(406) request' do
    case method_type
    when :get
      get action,
          params: params,
          headers: header_without_authentication
    when :post
      post action,
           params: params,
           headers: header_without_authentication
    when :patch
      patch action,
          params: params,
          headers: header_without_authentication
    when :delete
      delete action,
             params: params,
             headers: header_without_authentication
    end

    expect(response.status).to eq(406)
  end
end