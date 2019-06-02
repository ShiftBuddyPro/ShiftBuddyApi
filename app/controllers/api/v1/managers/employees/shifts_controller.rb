class Api::V1::Managers::Employees::ShiftsController < Api::EmployeeApplicationController
  before_action lambda {
                  unless current_user_is?(manager) || current_user_is?(employee)
                    render_unauthorized
                  end
                }
  attr_accessor :employee_id

  # GET /shifts
  def index
    shifts = Employee.find(params[:employee_id]).shifts
    render json: ShiftsSerializer.new(shifts.all).serialized_json,
           each_serializer: EmployeeSerializer
  end

  # POST /shifts
  def create
    @shift = Shift.new(employee_id: params[:employee_id])

    if @shift.save
      render json: @shift, status: :created
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  private

  def manager
    @manager ||= Manager.find params[:manager_id]
  end

  def employee
    @employee ||= Employee.find params[:employee_id]
  end
end
