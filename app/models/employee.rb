class Employee < ApplicationRecord
  has_secure_password
  belongs_to :manager, optional: true
  has_many :shifts

  default_scope { order(created_at: :desc) }
end
