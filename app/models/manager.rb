class Manager < ApplicationRecord
  has_secure_password
  has_one :business, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :tracked_items, dependent: :destroy
  has_many :shifts, through: :employees
end
