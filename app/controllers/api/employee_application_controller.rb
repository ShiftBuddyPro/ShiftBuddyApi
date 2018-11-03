class Api::EmployeeApplicationController < ApplicationController
  before_action :authenticate_request
  attr_reader :current_employee

  private

  def authenticate_request
    @current_employee = AuthorizeEmployeeApiRequest.call(request.headers).result
    @current_manager = AuthorizeManagerApiRequest.call(request.headers).result unless @current_employee
    render json: { error: 'Not Authorized' }, status: 401 unless @current_employee || @current_manager
  end
end
