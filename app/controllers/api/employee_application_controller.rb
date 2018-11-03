class Api::EmployeeApplicationController < ApplicationController
  before_action :authenticate_request
  attr_reader :current_employee
  attr_reader :current_manager

  private

  def authenticate_request
    @current_employee = AuthorizeEmployeeApiRequest.call(request.headers).result
    @current_manager = AuthorizeManagerApiRequest.call(request.headers).result unless @current_employee
    render json: { error: 'Not Authorized' }, status: 401 unless @current_employee || @current_manager
  end

  def authorize!(user)
    if user.class == Manager && current_manager
      return user if current_manager.id == user.id
    elsif user.class == Employee && current_employee
      return user if current_employee.id == user.id
    else
      false
    end
  end
end
