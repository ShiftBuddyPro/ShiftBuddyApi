class Api::V1::Managers::Employees::Shifts::PaidOutsController < Api::EmployeeApplicationController
  def index
    paid_outs = Shift.find(shift_id).paid_outs
    render json: paid_outs.all
  end

private

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
