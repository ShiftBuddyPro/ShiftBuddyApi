class ManagerSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer
  attribute :name

  has_many :employees
end
