class Manager < ApplicationRecord
  has_secure_password
  has_many :employees, dependent: :destroy
  has_many :tracked_items, dependent: :destroy
  has_many :shifts, through: :employees
end
