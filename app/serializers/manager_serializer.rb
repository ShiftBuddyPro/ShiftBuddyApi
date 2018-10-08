class ManagerSerializer < ApplicationSerializer
  attribute :name

  has_many :employees
end
