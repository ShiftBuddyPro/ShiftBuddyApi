class EmployeeSerializer < ApplicationSerializer
  attribute :name

  belongs_to :manager
end
