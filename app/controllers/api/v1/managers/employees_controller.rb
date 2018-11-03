class Api::V1::Managers::EmployeesController < Api::EmployeeApplicationController
  attr_accessor :manager

  # GET /manager/employees
  # Available to manager only
  def index
    employees = manager.employees
    if authorize! manager
      render json: employees.all,
             each_serializer: EmployeeSerializer,
             status: 200
    else
      render json: { error: 'Unauthorized.' }
    end
  end

  # POST /manager/:manager_id/employees
  # Available to manager only
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

private

  def employee_params
    params.require(:employee).permit(:name, :manager_id)
  end

  def manager
    @manager ||= Manager.find(params[:manager_id])
  end
end
