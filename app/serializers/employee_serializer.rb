class EmployeeSerializer < ApplicationSerializer
  attributes :name, :id, :username, :manager_id, :status

end
