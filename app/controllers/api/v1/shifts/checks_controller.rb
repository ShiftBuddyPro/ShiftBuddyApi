class Api::V1::Managers::Employees::Shifts::ChecksController < Api::EmployeeApplicationController
  def index
    checks = Shift.find(params[:shift_id]).checks
    render json: checks.all
  end
end
