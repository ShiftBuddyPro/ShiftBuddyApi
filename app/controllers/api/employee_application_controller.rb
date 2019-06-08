class Api::EmployeeApplicationController < ApplicationController
  before_action :authenticate_request
  attr_reader :current_employee
  attr_reader :current_manager

  private

  def authenticate_request
    @current_employee = AuthorizeEmployeeApiRequest.call(request.headers).result
    unless @current_employee
      @current_manager = AuthorizeManagerApiRequest.call(request.headers).result
    end
    unless @current_employee || @current_manager
      render json: { error: 'Not Authorized' }, status: 401
    end
  end

  def current_user_is?(record)
    record_matches_current_manager(record) ||
      record_matches_current_employee(record)
  end

  def record_matches_current_manager(record)
    record.class == Manager && current_manager &&
      current_manager.id == record.id
  end

  def record_matches_current_employee(record)
    record.class == Employee && current_employee &&
      current_employee.id == record.id
  end
end
