module ApiHelpers
  def json
    JSON.parse(last_response.body)
  end

  def set_api_headers
    request.headers['Accept'] = 'application/json;'
    request.headers['Authorization'] = @token
  end
end
