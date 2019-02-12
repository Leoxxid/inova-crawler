module ApiHelpers
  def json_body
    JSON.parse(response.body)
  end

  def set_api_headers
    set_token
    request.headers['Accept'] = 'application/json;'
    request.headers['Authorization'] = @token
  end

  private

  def set_token
    User.create!(email: 'example@inovamind.com',
                 password: '111111',
                 password_confirmation: '111111')
    auth = AuthenticateUser.call('example@inovamind.com', '111111')
    @token = auth.result
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :controller
end
