class ManagerSerializer < ApplicationSerializer
  attribute :name

  has_one :business
  has_many :employees
end
