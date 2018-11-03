ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/focus'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  include FactoryBot::Syntax::Methods
  include AssertJson

end

class ActionDispatch::IntegrationTest
  attr_reader :token, :auth_headers

  def sign_in(user)
    if user.class == Manager
      token = JsonWebToken.encode(manager_id: manager.id)
    elsif user.class == Employee
      token = JsonWebToken.encode(employee_id: employee.id)
    end
    return if token.nil?

    @auth_headers = {
      Authorization: token
    }
  end

  def get(uri, params = {}, headers = {})
    super uri, params: params[:params], headers: @auth_headers.present? ? @auth_headers.merge(headers) : headers
  end

  def patch(uri, params = {}, headers = {})
    super uri, params: params[:params], headers: @auth_headers.present? ? @auth_headers.merge(headers) : headers
  end

  def put(uri, params = {}, headers = {})
    super uri, params: params[:params], headers: @auth_headers.present? ? @auth_headers.merge(headers) : headers
  end

  def post(uri, params = {}, headers = {})
    super uri, params: params[:params], headers: @auth_headers.present? ? @auth_headers.merge(headers) : headers
  end

  def delete(uri, params = {}, headers = {})
    super uri, params: params[:params], headers: @auth_headers.present? ? @auth_headers.merge(headers) : headers
  end
  # Add more helper methods to be used by all tests here...
end
