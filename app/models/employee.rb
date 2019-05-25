class Employee < ApplicationRecord
  has_secure_password

  belongs_to :manager, optional: true
  has_many :shifts

  default_scope { order(created_at: :desc) }

  enum status: %i[active removed]

  def working?
    return false if shifts.empty?

    current_shift.active?
  end

  def current_shift
    shifts.first
  end
end
