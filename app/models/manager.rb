class Manager < ApplicationRecord
  has_many :employees, dependent: :destroy
end
