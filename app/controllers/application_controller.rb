# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  attr_reader :current_user

  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found
  before_action :authenticate_request

  def record_not_found
    error = 'Record not found'.to_json
    render json: { error: error }, status: :not_found
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
