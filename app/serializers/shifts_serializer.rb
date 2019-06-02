class ShiftsSerializer < ApplicationSerializer
  attribute :id
  attribute :completed_at
  attribute :status
  attribute :created_at

  attribute :employee_name do |shift|
    shift.employee.name
  end

  attribute :employee_id do |shift|
    shift.employee.id
  end
end
