class Employee < ApplicationRecord
  belongs_to :manager, optional: true
end
