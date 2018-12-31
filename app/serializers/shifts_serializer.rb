class ShiftsSerializer < ApplicationSerializer
  attribute :id

  attribute :employee_name do |shift|
    shift.employee.name
  end

  attribute :date do |shift|
    shift.created_at.to_formatted_s(:long_ordinal)
  end
end
