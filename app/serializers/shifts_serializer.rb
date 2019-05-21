class ShiftsSerializer < ApplicationSerializer
  attribute :id

  attribute :employee_name do |shift|
    shift.employee.name
  end

  attribute :employee_id do |shift|
    shift.employee.id
  end

  attribute :created_at
end
