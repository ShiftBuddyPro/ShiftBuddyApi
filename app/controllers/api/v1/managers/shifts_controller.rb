class Api::V1::Managers::ShiftsController < Api::EmployeeApplicationController
  before_action -> { render_unauthorized unless current_user_is?(manager) || current_user_is?(employee) }
  attr_accessor :employee_id

  # GET /shifts
  def index
    shifts = manager.shifts
    render json: ShiftsSerializer.new(shifts.all).serialized_json
  end

private

  def manager
    @manager ||= Manager.find params[:manager_id]
  end

  def employee
    @employee ||= Employee.find params[:employee_id]
  end
end
