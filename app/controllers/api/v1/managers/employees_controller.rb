class Api::V1::Managers::EmployeesController < Api::EmployeeApplicationController
  before_action lambda {
                  render_unauthorized && return unless current_user_is? manager
                }

  # GET /manager/employees
  # Available to manager only
  def index
    employees = manager.employees.active
    render json: employees.all, each_serializer: EmployeeSerializer, status: 200
  end

  # POST /manager/:manager_id/employees
  # Available to manager only
  def create
    @employee =
      Employee.new(employee_params.merge({ manager_id: params[:manager_id] }))

    if @employee.save
      @employee.active!
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :name,
      :manager_id,
      :username,
      :password,
      :password_confirmation
    )
  end

  def manager
    @manager ||= Manager.find(params[:manager_id])
  end
end
